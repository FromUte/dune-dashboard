Dashboard.UsersTabController = Ember.ArrayController.extend Dashboard.SearchableBaseController, Dashboard.PaginableControllerMixin,
  baseRouteName: 'users'

  defaultSearchFields:
    query: null

Dashboard.UsersSearchController = Dashboard.UsersTabController.extend Dashboard.SearchableController,
  baseRouteName: 'users'
