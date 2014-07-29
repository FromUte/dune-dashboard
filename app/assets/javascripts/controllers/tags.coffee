Dashboard.TagsTabController = Ember.ArrayController.extend Dashboard.PaginableControllerMixin,
  actions:
    destroy: (item)->
      if window.confirm(Ember.I18n.t('words.are_you_sure_to_delete'))
        item.destroyRecord()

        @removeObjects(item)

Dashboard.TagsEditController = Ember.ObjectController.extend
  actions:
    save: ->
      tag = @get('model')

      tag.save()
        .then =>
          @transitionToRoute 'tags'
        .catch ->
          # must supply catch promise, otherwise Ember will throw a
          # 'backend rejected the commit' error.

    cancel: ->
      @transitionToRoute('tags')

Dashboard.TagsNewController = Dashboard.TagsEditController.extend()
