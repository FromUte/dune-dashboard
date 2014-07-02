Dashboard.ApplicationAdapter = DS.ActiveModelAdapter.extend
  namespace: 'api'

Dashboard.ApplicationStore = DS.Store.extend
  adapter: Dashboard.ApplicationAdapter.create()
