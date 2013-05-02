#!/usr/bin/env rake
begin
	require 'bundler/setup'
rescue LoadError
	puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
begin
	require 'rdoc/task'
rescue LoadError
	require 'rdoc/rdoc'
	require 'rake/rdoctask'
	require 'rdoc/task'
	RDoc::Task = Rake::RDocTask
end

Bundler::GemHelper.install_tasks
require 'rspec/core/rake_task'

# I don't know what this task does but I'd like to use it some day
RDoc::Task.new(:rdoc) do |rdoc|
	rdoc.rdoc_dir = 'rdoc'
	rdoc.title = 'LinuxMintPostinstallManager'
	rdoc.options << '--line-numbers'
	rdoc.rdoc_files.include('README.rdoc')
	rdoc.rdoc_files.include('lib/**/*.rb')
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = "spec/*_spec.rb"
end

RSpec::Core::RakeTask.new(:current) do |t|
  t.pattern = "spec/*_spec.rb"
  t.rspec_opts = '--tag current'
end

#RSpec::Core::RakeTask.new
task :default => :spec
