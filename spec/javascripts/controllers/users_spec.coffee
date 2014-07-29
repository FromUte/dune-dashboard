describe 'UsersTabController', ->
  it 'has SearchableBaseController in it', ->
    ok(
      Dashboard.SearchableBaseController.detect Dashboard.UsersTabController.create()
    )

  it 'has PaginableControllerMixin in it', ->
    ok(
      Dashboard.PaginableControllerMixin.detect Dashboard.UsersTabController.create()
    )

describe 'UsersSearchController', ->
  it 'has SearchableController in it', ->
    ok(
      Dashboard.SearchableController.detect Dashboard.UsersSearchController.create()
    )
