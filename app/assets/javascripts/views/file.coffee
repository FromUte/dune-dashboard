Dashboard.FileView = Ember.View.extend
  tagName: 'input'
  attributeBindings: ['type', 'id']
  type: 'file'

  change: (e)->
    @set('file', e.target.files[0])
