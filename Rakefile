begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

APP_RAKEFILE = File.expand_path('../spec/dummy/Rakefile', __FILE__)
load 'rails/tasks/engine.rake'

Bundler::GemHelper.install_tasks

desc 'Run the javascript specs'
task :teaspoon => 'app:teaspoon'
task :spec => 'app:teaspoon'

require 'dune/dashboard/i18n'

namespace :i18n do
  desc 'Export the messages files'
  task :export do
    Dune::Dashboard::I18n.export!
  end
end
