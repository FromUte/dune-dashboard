Dashboard.Channel = DS.Model.extend
  user: DS.belongsTo('user')
  name: DS.attr('string')
  description: DS.attr('string')
  permalink: DS.attr('string')
  state: DS.attr('string')
  created_at: DS.attr('date')
  html_url: DS.attr('string')
  video_url: DS.attr('string')
  submit_your_project_text: DS.attr('string')
  how_it_works: DS.attr('string')
  accepts_projects: DS.attr('boolean')
  image: DS.attr('file')
  start_hero_image: DS.attr('file')
  start_content: DS.attr('object')
  success_content: DS.attr('object')

  userEmail: DS.attr('string')

  visible: (->
    if @get('state') == 'online'
      return true
    else
      return false
  ).property('state')
