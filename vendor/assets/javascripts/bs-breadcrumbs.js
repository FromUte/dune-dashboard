/*
Breadcrumbs compponent.

THIS COMPPONENT IS CUSTOMIZED!
*/


(function() {
  Bootstrap.BsBreadcrumbsItem = Bootstrap.ItemView.extend({
    tagName: ['li'],
    classNameBindings: ["isActive:active"],
    template: Ember.Handlebars.compile('{{#if view.content.icon.length}}<i class="{{unbound view.content.icon}}"></i>{{/if}} {{#unless view.isActive}} {{#if view.content.model}}{{#link-to view.content.route model.id}}{{view.content.name}}{{/link-to}}{{else}}{{#link-to view.content.route}}{{view.content.name}}{{/link-to}}{{/if}}{{else}}{{view.content.name}}{{/unless}}'),
    isActive: (function() {
      return this.get('content.active');
    }).property('content.active')
  });

  Bootstrap.BsBreadcrumbs = Bootstrap.ItemsView.extend(Bootstrap.WithRouter, {
    tagName: ['ol'],
    classNames: ['breadcrumb'],
    currentPathObserver: (function() {
      this.get('router');
      return this.send('updateCrumbsByRoute');
    }).observes('router.url').on('init'),
    content: [],
    itemViewClass: Bootstrap.BsBreadcrumbsItem,
    nameDictionary: void 0,
    dictionaryNamePrefix: 'breadcrumbs',
    actions: {
      currentPathDidChange: function() {
        return this.send('updateCrumbsByRoute');
      },
      updateCrumbsByRoute: function() {
        var routes,
          _this = this;
        this.get('content').clear();
        routes = this.get('container').lookup('router:main');
        routes.get('router.currentHandlerInfos').forEach(function(route, i, arr) {
          var crumb, displayName, name, routeName, _ref, _ref1, _ref2;
          name = route.name;
          if (name.indexOf('.index') !== -1 || name === 'index') {
            return;
          }
          if ((_ref = route.handler.breadcrumbs) != null ? _ref.hidden : void 0) {
            return;
          }
          routeName = route.handler.routeName;
          if ((_ref1 = route.handler.breadcrumbs) != null ? _ref1.name : void 0) {
            displayName = route.handler.breadcrumbs.name;
            displayIcon = route.handler.breadcrumbs.icon
          } else if ((_ref2 = _this.get('nameDictionary')) != null ? _ref2["" + _this.dictionaryNamePrefix + "." + routeName] : void 0) {
            displayName = _this.get('nameDictionary')["" + _this.dictionaryNamePrefix + "." + routeName];
            displayIcon = null;
          } else {
            displayName = route.handler.routeName.split('.').pop();
            displayName = displayName[0].toUpperCase() + displayName.slice(1).toLowerCase();
            displayIcon = null;
          }
          crumb = Ember.Object.create({
            route: route.handler.routeName,
            name: displayName,
            model: null,
            icon: displayIcon
          });
          if (route.isDynamic) {
            crumb.setProperties({
              model: route.handler.context,
              name: route.handler.context.get('name')
            });
          }
          return _this.get('content').pushObject(crumb);
        });
        return this.get('content.lastObject').set('active', true);
      }
    }
  });

  Ember.Handlebars.helper('bs-breadcrumbs', Bootstrap.BsBreadcrumbs);

}).call(this);
