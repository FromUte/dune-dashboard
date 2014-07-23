Dashboard.IndexRoute = Dashboard.AuthenticatedRoute.extend
  title: (->
    Ember.I18n.t('titles.index')
  ).property()
