Dashboard.ApplicationRoute = Ember.Route.extend({})

Dashboard.Router.reopen
  location: 'history'
  rootURL: '/dashboard/'
