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

    destroy: (contribution)->
      if window.confirm(Ember.I18n.t('words.are_you_sure_to_delete'))
        contribution.destroyRecord()

        @removeObjects(contribution)

Dashboard.ContributionsSearchController = Dashboard.ContributionsTabController.extend Dashboard.SearchableController,
  baseRouteName: 'contributions'

