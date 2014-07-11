module 'Integration: Sessions',
  teardown: ->
    $.mockjaxClear()

test 'when user is not logged in, redirect to new session page', ->
  visit '/'
  andThen ->
    equal(currentRouteName(), 'sessionsNew')

test 'sessions new header text', ->
  visit '/sessions/new'
  andThen ->
    equal find('.header').text(), 'Sign In'

test 'sessions new sign in succeeds', ->
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

test 'sessions new sign in fails', ->
  stubAjax 'POST', '/api/sessions', 401, {}

  visit '/sessions/new'

  andThen ->
    fillIn('input[type=text]', 'foo@bar.com')
    fillIn('input[type=password]', 'foo@bar.com')
    click('input[type=submit]')

  andThen ->
    equal(currentRouteName(), 'sessionsNew')
    equal find('.sessions-new .notification').text(), 'Invalid email or password.'

test 'sessions sign out', ->
  signInUser()

  stubAjax 'DELETE', '/api/sessions', 200, {}

  visit '/'

  andThen ->
    click('header .user-sign-out')
  andThen ->
    equal(currentRouteName(), 'sessionsNew')
