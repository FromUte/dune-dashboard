Dashboard.SessionsNewController = Ember.Controller.extend
  email: null
  password: null

  actions:
    create: ->
      @auth.signIn(
        data:
          email:    @get 'email'
          password: @get 'password'
      )
      .catch ->
        Bootstrap.NM.push(Ember.I18n.t('sessions.new.invalid_password'), 'danger')
