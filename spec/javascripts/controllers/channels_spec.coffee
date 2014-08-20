describe 'ChannelsTabController', ->
  it 'has SearchableBaseController in it', ->
    ok(
      Dashboard.SearchableBaseController.detect Dashboard.ChannelsTabController.create()
    )

  it 'has PaginableControllerMixin in it', ->
    ok(
      Dashboard.PaginableControllerMixin.detect Dashboard.ChannelsTabController.create()
    )

describe 'ChannelsSearchController', ->
  it 'has SearchableController in it', ->
    ok(
      Dashboard.SearchableController.detect Dashboard.ChannelsSearchController.create()
    )
