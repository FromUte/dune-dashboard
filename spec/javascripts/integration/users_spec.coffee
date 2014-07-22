USER_JSON =
  id: 18
  bio: null
  created_at: "2014-07-04T12:42:41+00:00"
  email: "foo@bar.name"
  facebook_url: null
  linkedin_url: null
  other_url: null
  profile_type: "personal"
  twitter_url: null
  name: "Mr. Foo Bar"
  image_url: "http://neighbor.ly/uploads/user/uploaded_image/18/thumb_avatar_image.jpg"
  total_contributed: "70.0"
  admin: false
  url: "http://neighbor.ly/api/users/18"
  html_url: "http://neighbor.ly/neighbors/18-mrs-abigayle-gaylord"

USERS_JSON =
  users: [USER_JSON, USER_JSON]
  meta:
    page: 1
    total: 2
    total_pages: 10

describe 'Integration: Users', ->
  before ->
    signInUser()
    stubAjax 'GET', '/api/users', 200, USERS_JSON

  after ->
    $.mockjaxClear()

  it 'page title in the content header', ->
    expect(1)

    visit '/users'
    andThen ->
      equal find('.content-header h1').text(), 'Users'

  it 'tabs', ->
    expect(2)

    visit '/users'
    andThen ->
      equal find('ul.nav-tabs li').length, 1
      equal find('ul.nav-tabs li.active a').text(), 'All Users'

  it 'list the users', ->
    expect(1)

    visit '/users'
    andThen ->
      equal find('table tbody tr').length, 2

  it 'pagination', ->
    expect(2)
    sinon.stub(jQuery, 'ajax')

    visit '/users'
    andThen ->
      equal find('ul.pagination li').length, 11

    andThen ->
      click('ul.pagination li:eq(3) a')
      ok(jQuery.ajax.calledWithMatch({ url: '/api/users', data: { page: 3 } }))
