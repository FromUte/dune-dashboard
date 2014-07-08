Dashboard.SearchTab = Ember.View.extend
  type: 'view'
  templateName: 'search-tab'
  routeName: ''
  tagName: ''

  routeParams: (->
    @get('controller.searchRouteParams')
  ).property('controller.searchRouteParams')

  hasSearch: (->
    hasSearch = false

    $.map @get('controller.search'), (value)=>
      if value != null
        hasSearch = true

    return hasSearch
  ).property('controller.search')
