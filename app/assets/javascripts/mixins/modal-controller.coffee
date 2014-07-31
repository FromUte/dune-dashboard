Dashboard.ModalControllerMixin = Ember.Mixin.create
  actions:
    cancel: ->
      @send 'closeModal'

    close: ->
      @send 'closeModal'
