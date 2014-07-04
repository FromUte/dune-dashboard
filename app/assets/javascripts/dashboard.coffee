Dashboard = window.Dashboard = Ember.Application.create
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: false

Ember.View.reopen(Em.I18n.TranslateableAttributes)
