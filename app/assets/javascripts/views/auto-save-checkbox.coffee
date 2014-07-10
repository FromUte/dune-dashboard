Dashboard.AutoSaveCheckboxView = Ember.View.extend
  template: Ember.Handlebars.compile("{{input type='checkbox' checked=view.attr}}")
  tagName: 'span'

  attributeBindings: [
    'attr'
    'resource'
  ]

  didInsertElement: ->
    self = this
    @$('input').on 'change', ->
      self.set('attr', $(this).is(':checked'))
      self.get('resource').save()
