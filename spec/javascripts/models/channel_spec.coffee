describe 'Channel', ->
  it 'is a DS.Model', ->
    ok(Dashboard.Channel)
    ok(DS.Model.detect(Dashboard.Channel))
