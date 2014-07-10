Dashboard.ProjectSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    user:
      embedded: 'always'
