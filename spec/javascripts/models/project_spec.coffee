describe 'Project', ->
  it 'is a DS.Model', ->
    ok(Dashboard.Project)
    ok(DS.Model.detect(Dashboard.Project))
