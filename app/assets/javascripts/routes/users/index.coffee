Dashboard.UsersIndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo('users.tab')

Dashboard.UsersTabRoute = Ember.Route.extend Dashboard.PaginableRouteMixin,
  breadcrumbs: false
  title: Ember.I18n.t('titles.users.index')

  renderTemplate: ->
    @render('users/index')

  model: ->
    @store.findQuery('user')

Dashboard.UsersSearchRoute = Dashboard.UsersTabRoute.extend Dashboard.SearchableRoute,
  baseRouteName: 'users'
  resourceName: 'user'
