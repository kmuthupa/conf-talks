require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "app"
  t.libs << "test"
  t.test_files = FileList['test/*.rb']
end

