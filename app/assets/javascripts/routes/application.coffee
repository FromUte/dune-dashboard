Dashboard.ApplicationRoute = Ember.Route.extend
  authRedirectable: true

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
