Ember.Test.registerAsyncHelper "authenticateSession", (app) ->
  stubAjax 'GET', '/api/users/1', 200, FIXTURES.user(1)

  session = app.__container__.lookup('simple-auth-session:main')
  session.authenticate "simple-auth-authenticator:test"
  wait()

Ember.Test.registerAsyncHelper "invalidateSession", (app) ->
  session = app.__container__.lookup('simple-auth-session:main')
  session.invalidate()  if session.get("isAuthenticated")
  wait()
