Dashboard.ModalViewMixin = Ember.Mixin.create
  tagName: 'div'
  classNames: 'modal'

  didInsertElement: ->
    @$().attr('id', 'modal')

    @$().modal
      keyboard: false
      backdrop: 'static'

    @$().modal('show')

  willDestroyElement: ->
    @$().modal 'hide'
