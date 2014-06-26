begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

APP_RAKEFILE = File.expand_path('../spec/dummy/Rakefile', __FILE__)
load 'rails/tasks/engine.rake'

Bundler::GemHelper.install_tasks

namespace :spec do
  desc 'Run Javascript specs'
  task :js do
    system 'cd ./spec/dummy/ && bundle exec rake konacha:run'
  end

  desc 'Start server to run Javascript specs'
  task :serve do
    system 'cd ./spec/dummy/ && bundle exec rake konacha:serve'
  end
end

desc 'Run Javascript specs using spec:run'
task :spec do
  Rake::Task['spec:js'].invoke
  system 'bundle exec rspec'
end

require 'neighborly/dashboard/i18n'

namespace :i18n do
  desc 'Export the messages files'
  task :export do
    Neighborly::Dashboard::I18n.export!
  end

  desc 'install ember-i18n.js'
  task :update do
    Neighborly::Dashboard::I18n.update!
  end
end
