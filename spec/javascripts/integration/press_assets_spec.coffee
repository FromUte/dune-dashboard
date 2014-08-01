describe 'Integration: Press Assets', ->
  before ->
    authenticateSession()
    stubAjax 'GET', '/api/press_assets', 200, FIXTURES.press_assets()

  after ->
    $.mockjaxClear()
    Dashboard.reset()

  it 'has press_assets link on sidebar', ->
    expect(1)
    visit '/'
    andThen ->
      equal(find(".sidebar-menu a:contains('Press Assets')").length, 1)

  it 'has page title in the content header', ->
    expect(1)

    visit '/press_assets'
    andThen ->
      equal find('.content-header h1').text(), 'Press Assets'

  it 'list the press_assets', ->
    expect(1)

    visit '/press_assets'
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

        visit '/press_assets'
        andThen ->
          equal find('ul.pagination li').length, 11

        andThen ->
          click('ul.pagination li:eq(3) a')
          ok(jQuery.ajax.calledWithMatch({ url: '/api/press_assets', data: { page: 3 } }))

    context 'When clicked on previous page', ->
      it 'fetch new data filtering by page', ->
        expect(1)

        visit '/press_assets'
        andThen ->
          click('ul.pagination li:first a')
          ok(jQuery.ajax.calledWithMatch({ url: '/api/press_assets', data: { page: 2 } }))

    context 'When clicked on next page', ->
      it 'fetch new data filtering by page', ->
        expect(1)

        visit '/press_assets'
        andThen ->
          click('ul.pagination li:last a')
          ok(jQuery.ajax.calledWithMatch({ url: '/api/press_assets', data: { page: 4 } }))

