Dashboard.reopen
  SidebarView: Ember.View.extend
    templateName: 'sidebar'

    didInsertElement: ->
      $(".sidebar .treeview").tree()
