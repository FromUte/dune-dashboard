Ember.Handlebars.registerBoundHelper 'number-to-currency', (number, format) ->
  unless typeof format is "string"
    format = '$0,0[.]00'

  numeral(number).format(format)
