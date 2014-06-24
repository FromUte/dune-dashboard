#= require spec_helper

describe "Dashboard.Router", ->
  it "is an Ember.Router", ->
    assert.ok Dashboard.Router
    assert.ok Ember.Router.detect(Dashboard.Router)
