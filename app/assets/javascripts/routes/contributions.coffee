Dashboard.ContributionsIndexRoute = Dashboard.AuthenticatedRoute.extend
  redirect: ->
    @transitionTo('contributions.tab', 'pending')

Dashboard.ContributionsTabRoute = Dashboard.AuthenticatedRoute.extend
  breadcrumbs: false
  title: Ember.I18n.t('titles.contributions.index')

  renderTemplate: ->
    @render('contributions/index')

  model: (params)->
    filter = {}
    filter[params['filter']] = true
    @store.findQuery('contribution', filter)

Dashboard.ContributionsSearchRoute = Dashboard.ContributionsTabRoute.extend Dashboard.SearchableRoute,
  baseRouteName: 'contributions'
  resourceName: 'contribution'

