Dashboard.Loading =
  activate: ->
    # Only render the loading indicator after 0.25s
    @timer = Ember.run.later this, (->
      $('section.content').addClass('loading-section')
    ), 250

    return this

  deactivate: ->
    $('section.content').removeClass('loading-section')

    if @timer
      Ember.run.cancel(@timer)
