Dashboard.Auth = Ember.Auth.extend
  modules: ['emberData']
  session: 'cookie'
  request: 'jquery'
  response: 'json'
  strategy: 'token'
  tokenKey: 'access_token'
  tokenLocation: 'authHeader'
  tokenHeaderKey: 'AUTH-TOKEN'
  signInEndPoint: Dashboard.ApplicationAdapter.create().buildURL('sessions')
  signOutEndPoint: Dashboard.ApplicationAdapter.create().buildURL('sessions')
  emberData:
    userModel: 'user'
