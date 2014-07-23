Dashboard.TagsIndexRoute = Dashboard.AuthenticatedRoute.extend
  redirect: ->
    @transitionTo('tags.tab', 'popular')

Dashboard.TagsTabRoute = Dashboard.AuthenticatedRoute.extend
  breadcrumbs: false
  title: Ember.I18n.t('titles.tags.index')

  renderTemplate: ->
    @render('tags/index')

  model: (params)->
    filter = {}
    filter[params['filter']] = true
    @store.findQuery('tag', filter)
