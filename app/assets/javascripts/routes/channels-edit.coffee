Dashboard.ChannelsEditRoute = Dashboard.AuthenticatedRoute.extend
  title: Ember.I18n.t('titles.channels.edit')
  model: (params)->
    @store.find('channel', params['id'])
