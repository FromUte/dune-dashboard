describe 'Integration: Sessions', ->
  after ->
    $.mockjaxClear()

  it 'redirects to new session page', ->
    expect(1)
    visit '/'
    andThen ->
      equal(currentRouteName(), 'sessionsNew')

  it 'header text', ->
    expect(1)
    visit '/sessions/new'
    andThen ->
      equal find('.header').text(), 'Sign In'

  it 'sign in succeeds', ->
    expect(2)
    stubAjax 'POST', '/api/sessions', 201,
      {
        user_id: 1,
        access_token: 'some_token'
      }

    stubAjax 'GET', '/api/users/1', 200,
      {
        user: { id: 1, name: 'Foo Bar' }
      }

    visit '/sessions/new'

    andThen ->
      fillIn('input[type=text]', 'foo@bar.com')
      fillIn('input[type=password]', 'foo@bar.com')
      click('input[type=submit]')

    andThen ->
      equal(currentRouteName(), 'index')
      equal find('.current-user-name').text(), 'Foo Bar'

  it 'sign in fails', ->
    signOutUser()
    expect(2)
    stubAjax 'POST', '/api/sessions', 401, {}

    visit '/sessions/new'

    andThen ->
      fillIn('input[type=text]', 'foo@bar.com')
      fillIn('input[type=password]', 'foo@bar.com')
      click('input[type=submit]')

    andThen ->
      equal(currentRouteName(), 'sessionsNew')
      equal find('.notification').text(), 'Invalid email or password.'

  it 'sign out', ->
    expect(1)
    signInUser()

    stubAjax 'DELETE', '/api/sessions', 200, {}

    visit '/'

    andThen ->
      click('header .user-sign-out')
    andThen ->
      equal(Dashboard.__container__.lookup('simple-auth-session:main').isAuthenticated, false)
