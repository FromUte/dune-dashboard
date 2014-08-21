Dashboard.ChannelsTabController = Ember.ArrayController.extend Dashboard.SearchableBaseController, Dashboard.PaginableControllerMixin,
  baseRouteName: 'channels'

  defaultSearchFields:
    query: null

  actions:
    changeState: (channel, action)->
      channelUrl = Dashboard.ApplicationAdapter.prototype.buildURL('channels', channel.id)

      $.ajax url: "#{channelUrl}/#{action}", type: 'PUT'

      @get('target').send('refresh')

    destroy: (channel)->
      if window.confirm(Ember.I18n.t('words.are_you_sure_to_delete'))
        channel.destroyRecord()

        @removeObjects(channel)

Dashboard.ChannelsSearchController = Dashboard.ChannelsTabController.extend Dashboard.SearchableController,
  baseRouteName: 'channels'

Dashboard.ChannelsEditController = Ember.ObjectController.extend
  actions:
    save: ->
      channel = @get('model')

      channel.save()
        .then =>
          @transitionToRoute 'channels'
        .catch (errors)->
          console.log errors
          # must supply catch promise, otherwise Ember will throw a
          # 'backend rejected the commit' error.

    cancel: ->
      @transitionToRoute('channels')

Dashboard.ChannelsNewController = Dashboard.ChannelsEditController.extend()
