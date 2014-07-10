Dashboard.SearchTab = Ember.View.extend
  type: 'view'
  templateName: 'search-tab'
  routeName: ''
  tagName: ''

  routeParams: (->
    @get('controller.searchRouteParams')
  ).property('controller.searchRouteParams')

  hasSearch: (->
    hasValues = (values)->
      results = []

      $.map values, (value)=>
        if Ember.typeOf(value) == 'object'
          results.push hasValues(value)
        else if !Ember.empty(value)
          results.push true

      return [].concat.apply([], results)

    return $.inArray(true, hasValues(@get('controller.search'))) != -1
  ).property('controller.search')
