# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dune/dashboard/version'

Gem::Specification.new do |spec|
  spec.name          = 'dune-dashboard'
  spec.version       = Dune::Dashboard::VERSION
  spec.authors       = ['Legrand Pierre']
  spec.email         = ['legrand.work@gmail.com']
  spec.summary       = 'This is the dune Dashboard coming from neighborly'
  spec.description   = 'The Dashboard is the place where you manage your dune'
  spec.homepage      = 'https://github.com/FromUte/dune-dashboard'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '~> 4.0'
  spec.add_dependency 'sass-rails', '>= 0'
  spec.add_dependency 'coffee-rails', '>= 0'
  spec.add_dependency 'bootstrap-sass', '>= 0'
  spec.add_dependency 'font-awesome-sass', '~> 4.2'
  spec.add_dependency 'ember-rails', '~> 0.15'
  spec.add_dependency 'emblem-rails', '~> 0.2'
end
