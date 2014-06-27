Dashboard.ApplicationRoute = Ember.Route.extend
  breadcrumbs:
    name: 'Dashboard'
    icon: 'fa fa-home'
  title: (->
    Ember.I18n.t('titles.application')
  ).property()

  renderTemplate: ->
    this.render('layouts/application')
