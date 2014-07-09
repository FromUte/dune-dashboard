Dashboard.ProjectsTabController = Ember.Controller.extend Dashboard.SearchableBaseController,
  baseRouteName: 'projects'

  search:
    pg_search: null

Dashboard.ProjectsSearchController = Dashboard.ProjectsTabController.extend Dashboard.SearchableController,
  baseRouteName: 'projects'
