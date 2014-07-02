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
