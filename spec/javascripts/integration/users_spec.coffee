describe 'Integration: Users', ->
  before ->
    signInUser()
    stubAjax 'GET', '/api/users', 200, FIXTURES.users()

  after ->
    $.mockjaxClear()
    Dashboard.reset()

  it 'has users link on sidebar', ->
    expect(1)
    visit '/'
    andThen ->
      equal(find(".sidebar-menu a:contains('Users')").length, 1)

  it 'has page title in the content header', ->
    expect(1)

    visit '/users'
    andThen ->
      equal find('.content-header h1').text(), 'Users'

  it 'list the users', ->
    expect(1)

    visit '/users'
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

        visit '/users'
        andThen ->
          equal find('ul.pagination li').length, 11

        andThen ->
          click('ul.pagination li:eq(3) a')
          ok(jQuery.ajax.calledWithMatch({ url: '/api/users', data: { page: 3 } }))

    context 'When clicked on previous page', ->
      it 'fetch new data filtering by page', ->
        expect(1)

        visit '/users'
        andThen ->
          click('ul.pagination li:first a')
          ok(jQuery.ajax.calledWithMatch({ url: '/api/users', data: { page: 2 } }))

    context 'When clicked on next page', ->
      it 'fetch new data filtering by page', ->
        expect(1)

        visit '/users'
        andThen ->
          click('ul.pagination li:last a')
          ok(jQuery.ajax.calledWithMatch({ url: '/api/users', data: { page: 4 } }))

  describe 'search', ->
    before ->
      sinon.spy(jQuery, 'ajax')

    after ->
      jQuery.ajax.restore()

    context 'When making the search', ->
      it 'fetch new data filtering searched value', ->
        expect(1)

        visit '/users'
        andThen ->
          fillIn 'form.search input[type=text]', 'test'
          click 'form.search .btn'
        andThen ->
          ok(jQuery.ajax.calledWithMatch({ url: '/api/users', data: 'query=test' }))

      it 'creates a new tab to show the results', ->
        expect(1)

        visit '/users'
        andThen ->
          fillIn 'form.search input[type=text]', 'test'
          click 'form.search .btn'
        andThen ->
          equal(find('.nav-tabs li.active a').text(), 'Search Results')

    context 'When accessing the search directly by url', ->
      it 'fetch the data filtering by params', ->
        expect(1)

        visit '/users/search/query=foobar'
        andThen ->
          ok(jQuery.ajax.calledWithMatch({ url: '/api/users', data: 'query=foobar' }))

      it 'has a search results tab', ->
        expect(1)

        visit '/users/search/query=foobar'
        andThen ->
          equal(find('.nav-tabs li.active a').text(), 'Search Results')
