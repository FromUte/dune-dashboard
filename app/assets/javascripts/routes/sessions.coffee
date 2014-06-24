Dashboard.SessionsNewRoute = Ember.Route.extend
  renderTemplate: ->
    this.render('sessions/new')

Dashboard.SessionsDestroyRoute = Ember.Route.extend
  activate: ->
    @auth.signOut()
