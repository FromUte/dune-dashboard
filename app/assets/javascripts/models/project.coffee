Dashboard.Project = DS.Model.extend
  user: DS.belongsTo('user')
  channel: DS.belongsTo('channel')
  name: DS.attr('string')
  permalink: DS.attr('string')
  category: DS.attr('string')
  goal: DS.attr('string')
  pledged: DS.attr('string')
  recommended: DS.attr('boolean')
  featured: DS.attr('boolean')
  home_page: DS.attr('boolean')
  online_date: DS.attr('date')
  expires_at: DS.attr('date')
  state: DS.attr('string')
  rights: DS.attr('object')
  html_url: DS.attr('string')
