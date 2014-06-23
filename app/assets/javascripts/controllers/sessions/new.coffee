Dashboard.SessionsNewController = Ember.Controller.extend
  email: null
  password: null

  actions:
    create: ->
      @auth.signIn
        data:
          email:    @get 'email'
          password: @get 'password'
