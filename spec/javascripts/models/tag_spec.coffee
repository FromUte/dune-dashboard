#= require spec_helper

describe 'Tag', ->
  beforeEach( ->
    Test.store = TestUtil.lookupStore()
  )

  it 'is a DS.Model', ->
    expect(Dashboard.Tag).to.be.ok
    expect(DS.Model.detect(Dashboard.Tag)).to.be.ok

