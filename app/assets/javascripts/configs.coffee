window.ENV = window.ENV || {}
window.ENV['simple-auth-devise'] = {
  serverTokenEndpoint: Dashboard.ApplicationAdapter.create().buildURL('sessions')
}

window.ENV['simple-auth'] = {
  authenticationRoute: 'sessionsNew',
  authorizer: 'authorizer:custom',
  store: 'simple-auth-session-store:local-storage'
}
