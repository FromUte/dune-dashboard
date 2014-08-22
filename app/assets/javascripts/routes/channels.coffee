Dashboard.ChannelsIndexRoute = Dashboard.AuthenticatedRoute.extend
  redirect: ->
    @transitionTo('channels.tab')

Dashboard.ChannelsTabRoute = Dashboard.AuthenticatedRoute.extend
  breadcrumbs: false
  title: Ember.I18n.t('titles.channels.index')

  renderTemplate: ->
    @render('channels/index')

  model: ->
    @store.findQuery('channel')

  actions:
    refresh: ->
      @refresh()

Dashboard.ChannelsSearchRoute = Dashboard.ChannelsTabRoute.extend Dashboard.SearchableRoute,
  baseRouteName: 'channels'
  resourceName: 'channel'
