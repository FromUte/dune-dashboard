Dashboard.reopen
  SidebarView: Ember.View.extend
    templateName: 'layouts/sidebar'

    didInsertElement: ->
      $(".sidebar .treeview").tree()
