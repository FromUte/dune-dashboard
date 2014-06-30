Dashboard.IndexRoute = Ember.Route.extend
  title: (->
    Ember.I18n.t('titles.index')
  ).property()
