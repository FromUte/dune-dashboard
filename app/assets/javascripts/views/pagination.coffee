Dashboard.PaginationView = Ember.View.extend
  tagName:       'div'
  classNames:    ['pagination-right']
  templateName: 'pagination'

  current: (->
    @get('controller.model.meta.page')
  ).property('controller.model.meta.page')

  totalPages: (->
    @get('controller.model.meta.total_pages')
  ).property('controller.model.meta.total_pages')

  isFirst: (->
    @get('current') == 1
  ).property('current')

  isLast: (->
    @get('current') == @get('totalPages')
  ).property('current', 'totalPages')

  pages: (->
    totalPages = @get('totalPages')
    current = @get('current')

    items = if totalPages < 9
      [1..totalPages]
    else
      switch current
        when 1, 2, 3, 4, 5
          [1, 2, 3, 4, 5, 6, '…', totalPages - 1, totalPages]
        when totalPages - 4, totalPages - 3, totalPages - 2, totalPages - 1, totalPages
          [1, 2, '…', totalPages - 5, totalPages - 4, totalPages - 3, totalPages - 2, totalPages - 1, totalPages]
        else
          [1, 2, '…', current - 1, current, current + 1, '…', totalPages - 1, totalPages]

    result = for i in items
      if i is '…'
        {
          value: '…'
          disabled: true
        }
      else
        {
          page:    i
          value:   i
          active:  i is current
        }

    result
  ).property('totalPages', 'current')
