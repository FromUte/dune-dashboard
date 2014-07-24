Dashboard.ContributionsTabController = Ember.ArrayController.extend Dashboard.SearchableBaseController, Dashboard.PaginableControllerMixin,
  baseRouteName: 'contributions'

  defaultSearchFields:
    query: null
    between_values:
      initial: null
      final: null
  actions:
    changeState: (contribution, action)->
      contributionUrl = Dashboard.ApplicationAdapter.prototype.buildURL('contributions', contribution.id)

      $.ajax url: "#{contributionUrl}/#{action}", type: 'PUT'

      @get('target').send('refresh')


Dashboard.ContributionsSearchController = Dashboard.ContributionsTabController.extend Dashboard.SearchableController,
  baseRouteName: 'contributions'

