Dashboard.ProjectsTabController = Ember.ArrayController.extend Dashboard.SearchableBaseController, Dashboard.PaginableControllerMixin,
  baseRouteName: 'projects'

  defaultSearchFields:
    query: null
    manageable: true
    between_created_at:
      starts_at: null
      ends_at: null
    between_expires_at:
      starts_at: null
      ends_at: null
    between_online_date:
      starts_at: null
      ends_at: null

  actions:
    launch: (project)->
      if window.confirm(Ember.I18n.t('projects.index.actions.are_you_sure_to_launch'))
        @send('changeState', project, 'launch')

    changeState: (project, action)->
      projectUrl = Dashboard.ApplicationAdapter.prototype.buildURL('projects', project.id)

      $.ajax url: "#{projectUrl}/#{action}", type: 'PUT'

      @get('target').send('refresh')

    destroy: (project)->
      if window.confirm(Ember.I18n.t('words.are_you_sure_to_delete'))
        project.destroyRecord()

        @removeObjects(project)

Dashboard.ProjectsSearchController = Dashboard.ProjectsTabController.extend Dashboard.SearchableController,
  baseRouteName: 'projects'
