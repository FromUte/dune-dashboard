# Teaspoon includes some support files, but you can use anything from your own support path too.
#= require support/sinon
#= require qunit-bdd/lib/qunit-bdd.js
# require support/your-support-file
#
# PhantomJS (Teaspoons default driver) doesn't have support for Function.prototype.bind, which has caused confusion.
# Use this polyfill to avoid the confusion.
#= require support/bind-poly
#
# Deferring execution
# If you're using CommonJS, RequireJS or some other asynchronous library you can defer execution. Call
# Teaspoon.execute() after everything has been loaded. Simple example of a timeout:
#
# Teaspoon.defer = true
# setTimeout(Teaspoon.execute, 1000)
#
# Matching files
# By default Teaspoon will look for files that match _test.{js,js.coffee,.coffee}. Add a filename_test.js file in your
# test path and it'll be included in the default suite automatically. If you want to customize suites, check out the
# configuration in config/initializers/teaspoon.rb
#
# Manifest
# If you'd rather require your test files manually (to control order for instance) you can disable the suite matcher in
# the configuration and use this file as a manifest.
#
# For more information: http://github.com/modeset/teaspoon
#
# You can require your own javascript files here. By default this will include everything in application, however you
# may get better load performance if you require the specific files that are being used in the test that tests them.
#= require dune-dashboard-libs
#= require ember-simple-auth/simple-auth-testing.js
#= require dune-dashboard-application
#= require dune-dashboard-templates
#= require_tree ./support/
#= require_tree ./helpers/
#= require_tree ./fixtures

# Prevent the router from manipulating the browser's URL.
Dashboard.Router.reopen location: 'none'

document.write('<div id="ember-testing-container"><div id="ember-testing"></div></div>')

Dashboard.rootElement = '#ember-testing'
Dashboard.setupForTesting()
Dashboard.injectTestHelpers()

window.stubAjax = (type, url, status, json) ->
  return $.mockjax
    type: type
    url: url
    status: status
    dataType: "json"
    responseText: json

$.mockjaxSettings.logging = false
$.mockjaxSettings.responseTime = 0
