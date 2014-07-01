Dashboard.TagsNewController = Ember.ObjectController.extend
  actions:
    save: ->
      @get('model').save()
        .then =>
          @transitionToRoute 'tags'
