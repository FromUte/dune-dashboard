describe 'Integration: Contributions', ->
  before ->
    authenticateSession()
    stubAjax 'GET', '/api/contributions', 200, FIXTURES.contributions()

  after ->
    $.mockjaxClear()
    Dashboard.reset()

  it 'has contributions link on sidebar', ->
    expect(1)
    visit '/'
    andThen ->
      equal(find(".sidebar-menu a:contains('Contributions')").length, 1)

  it 'has page title in the content header', ->
    expect(1)

    visit '/contributions'
    andThen ->
      equal find('.content-header h1').text(), 'Contributions'

  it 'list the contributions', ->
    expect(1)

    visit '/contributions'
    andThen ->
      equal find('table tbody tr').length, 2

  describe 'pagination', ->
    before ->
      sinon.spy(jQuery, 'ajax')

    after ->
      jQuery.ajax.restore()

    context 'When clicked on the page number', ->
      it 'fetch new data filtering by page', ->
        expect(2)

        visit '/contributions'
        andThen ->
          equal find('ul.pagination li').length, 11

        andThen ->
          click('ul.pagination li:eq(3) a')
          ok(jQuery.ajax.calledWithMatch({ url: '/api/contributions', data: { page: 3 } }))

    context 'When clicked on previous page', ->
      it 'fetch new data filtering by page', ->
        expect(1)

        visit '/contributions'
        andThen ->
          click('ul.pagination li:first a')
          ok(jQuery.ajax.calledWithMatch({ url: '/api/contributions', data: { page: 2 } }))

    context 'When clicked on next page', ->
      it 'fetch new data filtering by page', ->
        expect(1)

        visit '/contributions'
        andThen ->
          click('ul.pagination li:last a')
          ok(jQuery.ajax.calledWithMatch({ url: '/api/contributions', data: { page: 4 } }))

  describe 'search', ->
    before ->
      sinon.spy(jQuery, 'ajax')

    after ->
      jQuery.ajax.restore()

    context 'When making the search', ->
      it 'fetch new data filtering searched value', ->
        expect(1)

        visit '/contributions'
        andThen ->
          fillIn 'form.search input[type=text]', 'test'
          click 'form.search .btn'
        andThen ->
          ok(jQuery.ajax.calledWithMatch({ url: '/api/contributions', data: 'query=test&between_values%5Binitial%5D=test&between_values%5Bfinal%5D=test' }))

      it 'creates a new tab to show the results', ->
        expect(1)

        visit '/contributions'
        andThen ->
          fillIn 'form.search input[type=text]', 'test'
          click 'form.search .btn'
        andThen ->
          equal(find('.nav-tabs li.active a').text(), 'Search Results')

    context 'When accessing the search directly by url', ->
      it 'fetch the data filtering by params', ->
        expect(1)

        visit '/contributions/search/query=foobar'
        andThen ->
          ok(jQuery.ajax.calledWithMatch({ url: '/api/contributions', data: 'query=foobar' }))

      it 'has a search results tab', ->
        expect(1)

        visit '/contributions/search/query=foobar'
        andThen ->
          equal(find('.nav-tabs li.active a').text(), 'Search Results')
