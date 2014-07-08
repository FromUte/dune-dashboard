Dashboard.SearchableRoute = Ember.Mixin.create
  baseRouteName: null
  resourceName: null
  queryParams: null

  setupController: (controller, model)->
    @_super(controller, model)
    if @queryParams
      controller.set('search', $.deparam(@queryParams))
      Dashboard.__container__.lookup("controller:#{@baseRouteName}Tab").set('search', controller.get('search'))

  model: (params)->
    search = @get('controller.search')
    if search
      filter = search
      @queryParams = null
    else if params.query
      @queryParams = params.query
      filter = params.query

    @store.findQuery(@resourceName, filter)

Dashboard.SearchableBaseController = Ember.Mixin.create
  baseRouteName: null
  searchRouteParams: null
  search: {}

  updateSearchRouteParams: (->
    @getController('Search').set('searchRouteParams', $.param(@get('search')))
    @getController('Tab').set('searchRouteParams', $.param(@get('search')))
  ).observes('search')

  actions:
    submitSearch: ->
      @updateSearchRouteParams()
      @getController('Search').set('search', @get('search'))
      @transitionToRoute("#{@baseRouteName}.search", $.param(@get('search')))

    closeSearch: ->
      @getController('Search').set('search', {})
      @getController('Tab').set('search', {})

      if @constructor.toString().match("#{@baseRouteName.capitalize()}SearchController")
        @transitionToRoute('projects.tab', 'online')

  getController: (name)->
    Dashboard.__container__.lookup("controller:#{@baseRouteName}#{name}")

Dashboard.SearchableController = Ember.Mixin.create
  baseRouteName: null

  actions:
    submitSearch: ->
      @_super()
      Dashboard.__container__.lookup("controller:#{@baseRouteName}Tab").set('search', @get('search'))
