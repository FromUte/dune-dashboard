Dashboard.PressAssetsRoute = Dashboard.AuthenticatedRoute.extend
  breadcrumbs:
    name: Ember.I18n.t('titles.press_assets.index')

Dashboard.PressAssetsIndexRoute = Dashboard.AuthenticatedRoute.extend
  breadcrumbs: false
  title: Ember.I18n.t('titles.press_assets.index')

  renderTemplate: ->
    @render('press_assets/index')

  model: (params)->
    @store.findQuery('press_asset', {})
