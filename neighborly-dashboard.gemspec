# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'neighborly/dashboard/version'

Gem::Specification.new do |spec|
  spec.name          = 'neighborly-dashboard'
  spec.version       = Neighborly::Dashboard::VERSION
  spec.authors       = ['Josemar Luedke']
  spec.email         = ['josemarluedke@gmail.com']
  spec.summary       = 'This is the Neighbor.ly Dashboard'
  spec.description   = 'The Dashboard is the place where you manage your Neighbor.ly'
  spec.homepage      = 'https://github.com/neighborly/neighborly-dashboard'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '~> 4.0'
  spec.add_dependency 'sass-rails'
  spec.add_dependency 'coffee-rails'
  spec.add_dependency 'bootstrap-sass'
  spec.add_dependency 'font-awesome-sass'
  spec.add_dependency 'ember-rails', '~> 0.15.0'
  spec.add_dependency 'emblem-rails', '~> 0.2.1'

  spec.add_dependency 'ember-auth-rails'
  spec.add_dependency 'ember-auth-source', '~> 9.0.7'

  spec.add_dependency 'ember-auth-request-jquery-rails'
  spec.add_dependency 'ember-auth-request-jquery-source', '~> 1.0.3'

  spec.add_dependency 'ember-auth-response-json-rails'
  spec.add_dependency 'ember-auth-response-json-source', '~> 1.0.2'

  spec.add_dependency 'ember-auth-strategy-token-rails'
  spec.add_dependency 'ember-auth-strategy-token-source', '~> 1.0.2'

  spec.add_dependency 'ember-auth-session-cookie-rails'
  spec.add_dependency 'ember-auth-session-cookie-source', '~> 1.0.1'

  spec.add_dependency 'ember-auth-module-ember_data-rails'
  spec.add_dependency 'ember-auth-module-ember_data-source', '~> 1.0.2'

  spec.add_dependency 'ember-auth-module-auth_redirectable-rails'
  spec.add_dependency 'ember-auth-module-auth_redirectable-source', '~> 1.0.3'
end
