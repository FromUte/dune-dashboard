Ember.Application.initializer
  name: 'session'
  after: 'ember-auth-load'

  initialize: (container, application) ->
    Dashboard.Session = Ember.Object.extend(
       init: ->
        auth = container.lookup 'auth:main'

        auth.addHandler 'signInSuccess', ->
          sessionStorage.setItem('authToken', auth.get('authToken'))
          sessionStorage.setItem('authUserId', auth.get('userId'))

        auth.addHandler 'signOutSuccess', ->
          sessionStorage.removeItem('authToken')
          sessionStorage.removeItem('authUserId')

        authToken = sessionStorage.getItem('authToken')
        authUserId = sessionStorage.getItem('authUserId')

        if authToken != null && authUserId != null
          auth.createSession access_token: authToken, user_id: authUserId
    ).create()
