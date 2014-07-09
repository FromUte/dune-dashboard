Dashboard.TagsTabController = Ember.ArrayController.extend
  actions:
    destroy: (item)->
      if window.confirm(Ember.I18n.t('words.are_you_sure_to_delete'))
        item.destroyRecord()

        @removeObjects(item)
