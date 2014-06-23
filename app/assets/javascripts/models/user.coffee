Dashboard.User = DS.Model.extend
  name: DS.attr('string')
  email: DS.attr('string')
  access_token: DS.attr('string')
