Dashboard.TagsIndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo('tags.tab', 'popular')

Dashboard.TagsTabRoute = Ember.Route.extend
  breadcrumbs: false
  title: Ember.I18n.t('titles.tags.index')

  renderTemplate: ->
    @render('tags/index')

  model: (params)->
    filter = {}
    filter[params['filter']] = true
    @store.findQuery('tag', filter)
