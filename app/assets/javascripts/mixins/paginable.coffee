Dashboard.PaginableControllerMixin = Ember.Mixin.create
  actions:
    refreshPageData: (page)->
      query = $.extend(@get('model')['query'], { page: page })

      @store.findQuery(@get('model').type, query).then (records)=>
        @set('model', records)

    gotoPage: (page) ->
      @send('refreshPageData', page)

    nextPage: ->
      current = @get('model.meta.page') or 1
      @send('gotoPage', current + 1) unless current + 1 > @get('model.meta.total_pages')

    previousPage: ->
      current = @get('model.meta.page') or 2
      @send('gotoPage', current - 1)

    lastPage: ->
      last = @get('model.meta.total_pages') or 1
      @send('gotoPage', last)

    firstPage: ->
      @send('gotoPage', 1)
