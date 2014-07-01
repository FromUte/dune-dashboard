Dashboard.TagsNewRoute = Ember.Route.extend
  title: Ember.I18n.t('titles.tags.new')
  model: ->
    @store.createRecord('tag', {})
