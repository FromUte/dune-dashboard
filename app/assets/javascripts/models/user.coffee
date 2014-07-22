Dashboard.User = DS.Model.extend
  name: DS.attr('string')
  email: DS.attr('string')
  image_url: DS.attr('string')
  admin: DS.attr('boolean')
  total_contributed: DS.attr('string')
  profile_type: DS.attr('string')
  html_url: DS.attr('string')

  edit_html_url: (->
    "#{@get('html_url')}/edit"
  ).property('html_url')
