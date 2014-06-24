Dashboard.ApplicationAdapter = DS.RESTAdapter.extend
  namespace: 'api'

Dashboard.ApplicationStore = DS.Store.extend
  adapter: Dashboard.ApplicationAdapter.create()
