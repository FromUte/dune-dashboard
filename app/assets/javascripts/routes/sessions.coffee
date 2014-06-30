Dashboard.SessionsNewRoute = Ember.Route.extend
  authRedirectable: false
  renderTemplate: ->
    this.render('sessions/new')

Dashboard.SessionsDestroyRoute = Ember.Route.extend
  activate: ->
    @auth.signOut().then -> window.location.reload true
