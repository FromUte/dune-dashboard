Dashboard.Router.reopen
  location: 'history'
  rootURL: '/dashboard/'

Dashboard.Router.map ->
  @resource 'projects', ->

  @resource 'tags', ->
    @route 'filter', path: '/:filter'

    @route 'new'
    @route 'edit', path: '/:id/edit'

  @route 'sessionsNew', path: 'sessions/new'
  @route 'sessionsDestroy', path: 'sessions/destroy'
