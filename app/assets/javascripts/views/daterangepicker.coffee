Dashboard.DaterangepickerView = Ember.View.extend Em.I18n.TranslateableProperties,
  templateName: 'daterangepicker'
  classNames: ['form-group']
  attributeBindings: [
    'start'
    'end'
  ]
  start: null
  end: null
  format: 'MMMM D, YYYY'
  serverFormat: 'YYYY-MM-DD'
  didInsertElement: ->
    format = @get('format')
    @$('.daterangepicker-input').daterangepicker
      locale: { cancelLabel: 'Clear' }
      format: format
      startDate: @get('start')
      endDate: @get('end')
      ranges:
        Today: [
          moment()
          moment()
        ]
        Yesterday: [
          moment().subtract('days', 1)
          moment().subtract('days', 1)
        ]
        'Last 7 Days': [
          moment().subtract('days', 6)
          moment()
        ]
        'Last 30 Days': [
          moment().subtract('days', 29)
          moment()
        ]
        'This Month': [
          moment().startOf('month')
          moment().endOf('month')
        ]
        'Last Month': [
          moment().subtract('month', 1).startOf('month')
          moment().subtract('month', 1).endOf('month')
        ]
    , (start, end) =>
      @set 'start', start.format(@get('serverFormat'))
      @set 'end', end.format(@get('serverFormat'))

    @$('.daterangepicker-input').on 'cancel.daterangepicker', (ev, picker) =>
      @$('.daterangepicker-input').val ''
      @set('start', '')
      @set('end', '')

    @$('.daterangepicker-input').on 'show.daterangepicker', (ev, picker) =>
      if Ember.empty(@get('start')) && Ember.empty(@get('end'))
        console.log 'aaaaaddddd'
        picker.setStartDate moment()
        picker.setEndDate moment()

    if !Ember.empty(@get('start')) && !Ember.empty(@get('end'))
      visibleDate = "#{moment(@get('start')).format(format)} - #{moment(@get('end')).format(format)}"
      @$('.daterangepicker-input').attr 'value', visibleDate
