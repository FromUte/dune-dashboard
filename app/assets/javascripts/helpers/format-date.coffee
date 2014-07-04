Ember.Handlebars.registerBoundHelper 'format-date', (date, format) ->
  unless typeof format is "string"
    format = 'MMMM Do YYYY'

  moment(date).format(format)
