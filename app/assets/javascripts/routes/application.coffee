Dashboard.ApplicationRoute = Ember.Route.extend
  breadcrumbs:
    name: 'Dashboard'
    icon: 'fa fa-home'
  renderTemplate: ->
    this.render('layouts/application')
