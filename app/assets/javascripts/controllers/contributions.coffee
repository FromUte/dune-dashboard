Dashboard.ContributionsTabController = Ember.ArrayController.extend Dashboard.SearchableBaseController, Dashboard.PaginableControllerMixin,
  baseRouteName: 'contributions'

  defaultSearchFields:
    query: null
    between_values:
      initial: null
      final: null

Dashboard.ContributionsSearchController = Dashboard.ContributionsTabController.extend Dashboard.SearchableController,
  baseRouteName: 'contributions'

