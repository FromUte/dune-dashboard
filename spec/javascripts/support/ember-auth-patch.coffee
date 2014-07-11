Em.onLoad 'Ember.Application', (application) ->
  application.initializer
    name: "adapter-auth-injection"
    before: "ember-auth-load"

    initialize: (container, app) ->
      app.inject 'adapter', 'auth', 'auth:main'

Em.Auth.EmberDataAuthModule.reopen
  patch: ->
    DS.RESTAdapter.reopen
      ajax: (url, type, settings) ->
        @_super url, type, @auth.get("_strategy").serialize(settings || {})
