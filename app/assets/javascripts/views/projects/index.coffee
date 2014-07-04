Dashboard.ProjectsIndexView = Ember.View.extend
  templateName: 'projects/index'

  didInsertElement: ->
    $('.dropdown-toggle').dropdown()
