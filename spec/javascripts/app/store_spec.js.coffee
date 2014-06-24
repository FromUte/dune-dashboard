#= require spec_helper

describe "Dashboard.ApplicationStore", ->
  beforeEach( ->
    Test.store = TestUtil.lookupStore()
  )

  it "works with latest Ember-Data revision", ->
    assert.equal Test.store.get('revision'), 12
