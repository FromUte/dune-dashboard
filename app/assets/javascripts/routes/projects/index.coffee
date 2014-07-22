Dashboard.ProjectsIndexRoute = Dashboard.AuthenticatedRoute.extend
  redirect: ->
    @transitionTo('projects.tab', 'online')

Dashboard.ProjectsTabRoute = Dashboard.AuthenticatedRoute.extend
  breadcrumbs: false
  title: Ember.I18n.t('titles.projects.index')

  renderTemplate: ->
    @render('projects/index')

  model: (params)->
    filter = {}
    filter[params['filter']] = true
    @store.findQuery('project', filter)

  actions:
    refresh: ->
      @refresh()

Dashboard.ProjectsSearchRoute = Dashboard.ProjectsTabRoute.extend Dashboard.SearchableRoute,
  baseRouteName: 'projects'
  resourceName: 'project'
