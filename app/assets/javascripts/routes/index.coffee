Dashboard.IndexRoute = Ember.Route.extend
  authRedirectable: true
  title: (->
    Ember.I18n.t('titles.index')
  ).property()
