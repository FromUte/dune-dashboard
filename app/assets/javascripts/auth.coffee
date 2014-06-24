Dashboard.Auth = Ember.Auth.extend
  request: 'jquery'
  response: 'json'
  strategy: 'token'
  session: 'cookie'

  modules: [
    'emberData'
    'authRedirectable'
  ]

  tokenKey: 'access_token'
  tokenIdKey: 'user_id'
  tokenLocation: 'authHeader'
  tokenHeaderKey: 'AUTH-TOKEN'

  signInEndPoint: Dashboard.ApplicationAdapter.create().buildURL('sessions')
  signOutEndPoint: Dashboard.ApplicationAdapter.create().buildURL('sessions')

  emberData:
    userModel: 'user'

  authRedirectable:
    route: 'sessionsNew'
