#= require spec_helper

describe 'Project', ->
  beforeEach( ->
    Test.store = TestUtil.lookupStore()
  )

  it 'is a DS.Model', ->
    expect(Dashboard.Project).to.be.ok
    expect(DS.Model.detect(Dashboard.Project)).to.be.ok

