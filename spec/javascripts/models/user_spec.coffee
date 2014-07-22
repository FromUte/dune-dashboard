describe 'User', ->
  it 'is a DS.Model', ->
    ok(Dashboard.User)
    ok(DS.Model.detect(Dashboard.User))
