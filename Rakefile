require 'rubygems'
require 'rake'

load 'lib/apn/tasks.rb'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "sentia_apn_sender"
    gem.summary = %Q{Resque-based background worker to send Apple Push Notifications over a persistent TCP socket. Original gem by Kali Donovan and modified by Sentia.}
    gem.description = %Q{Resque-based background worker to send Apple Push Notifications over a persistent TCP socket. Includes Resque tweaks to allow persistent sockets between jobs, helper methods for enqueueing APN notifications, and a background daemon to send them. Original gem by Kali Donovan and modified by Sentia.}
    gem.email = "mario.visic@sentia.com.au"
    gem.homepage = 'https://github.com/sentia/apn_sender'
    gem.authors = ['Kali Donovan', 'Mario Visic']
    gem.add_dependency 'resque'
    gem.add_dependency 'resque-access_worker_from_job'
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "apple_push_notification #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
