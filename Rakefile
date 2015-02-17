require './app'
require 'rake/testtask'
#require 'sinatra/activerecord/rake'

task :default => :test

task :test do
  ENV['RACK_ENV'] = 'test'
  Rake::Task['db:migrate'].invoke

  Rake::TestTask.new do |t|
    t.libs << 'test'
    t.test_files = FileList['test/*_test.rb']
  end
end

#task :worker do
# 
#  app = ::PROJECTNAME::::Worker.allocate
#  app.send :initialize
#  app.start( true )
#
#end
