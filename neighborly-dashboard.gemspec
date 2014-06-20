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
end
