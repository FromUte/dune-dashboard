Dashboard.TagsNewRoute = Dashboard.AuthenticatedRoute.extend
  title: Ember.I18n.t('titles.tags.new')
  model: ->
    @store.createRecord('tag', {})

