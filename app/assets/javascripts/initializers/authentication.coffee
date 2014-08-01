Dashboard.CustomAuthenticator = SimpleAuth.Authenticators.Devise.extend
  restore: (properties) ->
    new Ember.RSVP.Promise((resolve, reject) ->
      if not Ember.isEmpty(properties.access_token)
        resolve properties
      else
        reject()
      return
    )

  authenticate: (credentials) ->
    _this = this
    new Ember.RSVP.Promise((resolve, reject) ->
      data =
        email: credentials.identification
        password: credentials.password

      _this.makeRequest(data).then ((response) ->
        Ember.run ->
          resolve response

      ), (xhr, status, error) ->
        Ember.run ->
          reject xhr.responseJSON or xhr.responseText
    )

Dashboard.CustomAuthorizer = SimpleAuth.Authorizers.Base.extend
  authorize: (jqXHR, requestOptions) ->
    accessToken = @get('session.access_token')
    if @get('session.isAuthenticated') and not Ember.isEmpty(accessToken)
      jqXHR.setRequestHeader 'Authorization', 'Token ' + accessToken

Ember.Application.initializer
  name: 'authentication'
  before: 'simple-auth'
  initialize: (container, application) ->
    container.register 'authenticator:custom', Dashboard.CustomAuthenticator
    container.register 'authorizer:custom', Dashboard.CustomAuthorizer

    SimpleAuth.Session.reopen
      currentUser: (->
        userId = @get('user_id')

        if Ember.isEmpty(userId) && Ember.testing
          userId = 1

        if !Ember.isEmpty(userId)
          Ember.run ->
            Dashboard.__container__.lookup('store:main').find('user', userId)
      ).property('user_id')
