Dashboard.Tag = DS.Model.extend
  name: DS.attr('string')
  visible: DS.attr('boolean', { defaultValue: false })
  total_projects: DS.attr('number')
