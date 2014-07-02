Dashboard.Router.reopen
  location: 'history'
  rootURL: '/dashboard/'

Dashboard.Router.map ->
  @resource 'projects', ->

  @resource 'tags', ->
    @route 'new'

  @route 'sessionsNew', path: 'sessions/new'
  @route 'sessionsDestroy', path: 'sessions/destroy'
