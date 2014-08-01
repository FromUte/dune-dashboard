Dashboard.PressAssetsEditRoute = Dashboard.AuthenticatedRoute.extend
  title: Ember.I18n.t('titles.press_assets.edit')
  model: (params)->
    @store.find('press_asset', params['id'])
