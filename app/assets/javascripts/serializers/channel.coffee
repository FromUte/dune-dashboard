Dashboard.ChannelSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    user:
      embedded: 'always'

  keyForRelationship: (key, type) ->
    if @_super(key, type) == 'user'
      'user_attributes'
    else
      @_super(key, type)
