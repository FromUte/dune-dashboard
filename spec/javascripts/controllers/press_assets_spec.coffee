describe 'PressAssetsIndexController', ->
  it 'has PaginableControllerMixin in it', ->
    ok(
      Dashboard.PaginableControllerMixin.detect Dashboard.PressAssetsIndexController.create()
    )
