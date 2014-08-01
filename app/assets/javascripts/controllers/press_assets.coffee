Dashboard.PressAssetsIndexController = Ember.ArrayController.extend Dashboard.PaginableControllerMixin,
  actions:
    destroy: (item)->
      if window.confirm(Ember.I18n.t('words.are_you_sure_to_delete'))
        item.destroyRecord()

        @removeObjects(item)

Dashboard.PressAssetsEditController = Ember.ObjectController.extend
  actions:
    save: ->
      press_asset = @get('model')

      press_asset.save()
        .then =>
          @transitionToRoute 'press_assets'
        .catch ->
          # must supply catch promise, otherwise Ember will throw a
          # 'backend rejected the commit' error.

    cancel: ->
      @transitionToRoute('press_assets')

Dashboard.PressAssetsNewController = Dashboard.PressAssetsEditController.extend()
