Dashboard.FileTransform = DS.Transform.extend
  serialize: (deserialized) ->
    (if Em.isNone(deserialized) then {} else deserialized)

  deserialize: (serialized) ->
    (if Em.isNone(serialized) then {} else serialized)
