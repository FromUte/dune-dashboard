Dashboard.ApplicationRoute = Ember.Route.extend
  renderTemplate: ->
    if @auth.get('signedIn')
      this.render('layouts/application')
    else
      this.render('layouts/login')
