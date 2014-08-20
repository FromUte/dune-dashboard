Dashboard.Channel = DS.Model.extend
  name: DS.attr('string')
  description: DS.attr('string')
  permalink: DS.attr('string')
  state: DS.attr('string')
  created_at: DS.attr('date')
  html_url: DS.attr('string')

  visible: (->
    if @get('state') == 'online'
      return true
    else
      return false
  ).property('state')
