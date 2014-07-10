Dashboard.ProjectsTabController = Ember.Controller.extend Dashboard.SearchableBaseController,
  baseRouteName: 'projects'

  defaultSearchFields:
    query: null
    between_created_at:
      starts_at: null
      ends_at: null
    between_expires_at:
      starts_at: null
      ends_at: null
    between_online_date:
      starts_at: null
      ends_at: null

Dashboard.ProjectsSearchController = Dashboard.ProjectsTabController.extend Dashboard.SearchableController,
  baseRouteName: 'projects'
