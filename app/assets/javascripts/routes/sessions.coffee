Dashboard.SessionsNewRoute = Ember.Route.extend
  renderTemplate: ->
    this.render('sessions/new', outlet: 'login')
