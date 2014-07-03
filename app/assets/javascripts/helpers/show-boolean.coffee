Ember.Handlebars.helper 'show-boolean', (value)->
  if value
    return Ember.I18n.t('words._yes')
  else
    return Ember.I18n.t('words._no')
