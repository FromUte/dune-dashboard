Dashboard.UsersIndexRoute = Dashboard.AuthenticatedRoute.extend
  redirect: ->
    @transitionTo('users.tab')

Dashboard.UsersTabRoute = Dashboard.AuthenticatedRoute.extend
  breadcrumbs: false
  title: Ember.I18n.t('titles.users.index')

  renderTemplate: ->
    @render('users/index')

  model: ->
    @store.findQuery('user')

Dashboard.UsersSearchRoute = Dashboard.UsersTabRoute.extend Dashboard.SearchableRoute,
  baseRouteName: 'users'
  resourceName: 'user'
