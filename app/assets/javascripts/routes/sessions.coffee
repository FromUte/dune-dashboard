Dashboard.SessionsNewRoute = Ember.Route.extend
  authRedirectable: false
  renderTemplate: ->

Dashboard.SessionsDestroyRoute = Ember.Route.extend
  activate: ->
    @auth.signOut().then -> window.location.reload true
    this.render('sessions/new', outlet: 'login')
