Dashboard.Contribution = DS.Model.extend
  user: DS.belongsTo('user')
  project: DS.belongsTo('project')
  value: DS.attr('string')
  anonymous: DS.attr('boolean')
  state: DS.attr('string')
  rights: DS.attr('object')
