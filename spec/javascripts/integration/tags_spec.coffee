describe 'Integration: Tags', ->
  before ->
    authenticateSession()
    stubAjax 'GET', '/api/tags', 200, FIXTURES.tags()

  after ->
    $.mockjaxClear()
    Dashboard.reset()

  it 'has Tags link on sidebar', ->
    expect(1)
    visit '/'
    andThen ->
      equal(find(".sidebar-menu a:contains('Tags')").length, 1)

  it 'has page title in the content header', ->
    expect(1)

    visit '/tags'
    andThen ->
      equal find('.content-header h1').text(), 'Tags'

  it 'list the tags', ->
    expect(1)

    visit '/tags'
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

        visit '/tags'
        andThen ->
          equal find('ul.pagination li').length, 11

        andThen ->
          click('ul.pagination li:eq(3) a')
          ok(jQuery.ajax.calledWithMatch({ url: '/api/tags', data: { page: 3 } }))

    context 'When clicked on previous page', ->
      it 'fetch new data filtering by page', ->
        expect(1)

        visit '/tags'
        andThen ->
          click('ul.pagination li:first a')
          ok(jQuery.ajax.calledWithMatch({ url: '/api/tags', data: { page: 2 } }))

    context 'When clicked on next page', ->
      it 'fetch new data filtering by page', ->
        expect(1)

        visit '/tags'
        andThen ->
          click('ul.pagination li:last a')
          ok(jQuery.ajax.calledWithMatch({ url: '/api/tags', data: { page: 4 } }))
