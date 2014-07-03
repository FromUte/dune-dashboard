Dashboard.PaginatedRouteMixin = Ember.Mixin.create
  actions:
    refreshPageData: (controller, page)->
      query = $.extend(@controller.get('model')['query'], { page: page })

      @store.findQuery(@controller.get('model').type, query).then (records)=>
        metadata = records.store.typeMapFor(records.type).metadata
        @controller.set('model', records)

    gotoPage: (page) ->
      @send('refreshPageData', @get('controller'), page)

    nextPage: ->
      current = @get('controller.model.meta.page') or 1
      @gotoPage current + 1

    previousPage: ->
      current = @get('controller.model.meta.page') or 2
      @gotoPage current - 1

    lastPage: ->
      last = @get('controller.model.meta.total_pages') or 1
      @gotoPage last

    firstPage: ->
      @gotoPage 1
