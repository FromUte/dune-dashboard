require "bundler/gem_tasks"

namespace :spec do
  desc 'Run Javascript specs'
  task :run do
    system 'cd ./spec/dummy/ && bundle exec rake konacha:run'
  end

  desc 'Start server to run Javascript specs'
  task :serve do
    system 'cd ./spec/dummy/ && bundle exec rake konacha:serve'
  end
end

desc 'Run Javascript specs using spec:run'
task :spec do
  Rake::Task['spec:run'].invoke
end
