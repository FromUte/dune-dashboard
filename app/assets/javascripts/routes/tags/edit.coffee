Dashboard.TagsEditRoute = Ember.Route.extend
  title: Ember.I18n.t('titles.tags.edit')
  model: (params)->
    @store.find('tag', params['id'])
