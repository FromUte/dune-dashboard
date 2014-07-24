describe 'Contribution', ->
  it 'is a DS.Model', ->
    ok(Dashboard.Contribution)
    ok(DS.Model.detect(Dashboard.Contribution))
