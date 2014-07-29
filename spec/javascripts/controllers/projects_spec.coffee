describe 'ProjectsTabController', ->
  it 'has SearchableBaseController in it', ->
    ok(
      Dashboard.SearchableBaseController.detect Dashboard.ProjectsTabController.create()
    )

  it 'has PaginableControllerMixin in it', ->
    ok(
      Dashboard.PaginableControllerMixin.detect Dashboard.ProjectsTabController.create()
    )

describe 'ProjectsSearchController', ->
  it 'has SearchableController in it', ->
    ok(
      Dashboard.SearchableController.detect Dashboard.ProjectsSearchController.create()
    )
