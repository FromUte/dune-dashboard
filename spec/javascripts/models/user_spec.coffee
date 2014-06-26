#= require spec_helper

describe 'User', ->
  beforeEach( ->
    Test.store = TestUtil.lookupStore()
  )

  it 'is a DS.Model', ->
    expect(Dashboard.User).to.be.ok
    expect(DS.Model.detect(Dashboard.User)).to.be.ok
