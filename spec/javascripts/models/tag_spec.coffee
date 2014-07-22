describe 'Tag', ->
  it 'is a DS.Model', ->
    ok(Dashboard.Tag)
    ok(DS.Model.detect(Dashboard.Tag))
