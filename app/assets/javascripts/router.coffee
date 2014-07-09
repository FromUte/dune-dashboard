Dashboard.Router.reopen
  location: 'history'
  rootURL: '/dashboard/'

Dashboard.Router.map ->
  @resource 'projects', ->
    @route 'search', path: '/search/*query'
    @route 'tab', path: '/:filter'

  @resource 'tags', ->
    @route 'tab', path: '/:filter'

    @route 'new'
    @route 'edit', path: '/:id/edit'

  @route 'sessionsNew', path: 'sessions/new'
  @route 'sessionsDestroy', path: 'sessions/destroy'

