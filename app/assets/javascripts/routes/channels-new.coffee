Dashboard.ChannelsNewRoute = Dashboard.AuthenticatedRoute.extend
  title: Ember.I18n.t('titles.channels.new')
  model: ->
    @store.createRecord('channel', { user: @store.createRecord('user', {}) })
