Dashboard.TagsEditRoute = Dashboard.AuthenticatedRoute.extend
  title: Ember.I18n.t('titles.tags.edit')
  model: (params)->
    @store.find('tag', params['id'])
