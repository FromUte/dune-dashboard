Dashboard.AuthenticatedRoute = Ember.Route.extend SimpleAuth.AuthenticatedRouteMixin

Dashboard.ApplicationRoute = Ember.Route.extend SimpleAuth.ApplicationRouteMixin,
  breadcrumbs:
    name: 'Dashboard'
    icon: 'fa fa-home'
  title: (->
    Ember.I18n.t('titles.application')
  ).property()

  renderTemplate: ->
    this.render('layouts/application')

  actions:
    loading: ->
      loading = Dashboard.Loading.activate()
      @router.one('didTransition', loading, 'deactivate')

      return true

    sessionAuthenticationFailed: (error)->
      Bootstrap.NM.set('content', Ember.A())
      Bootstrap.NM.push(Ember.I18n.t('sessions.new.invalid_password'), 'danger')
