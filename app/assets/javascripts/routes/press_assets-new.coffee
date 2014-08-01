Dashboard.PressAssetsNewRoute = Dashboard.AuthenticatedRoute.extend
  title: Ember.I18n.t('titles.press_assets.new')
  model: ->
    @store.createRecord('press_asset', {})

