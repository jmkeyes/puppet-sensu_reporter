require 'bundler/setup'
require 'rspec/core/rake_task'
require 'puppet_blacksmith/rake_tasks'

desc 'Clean a built module package'
task :clean do
  FileUtils.rm_rf("pkg/")
end

desc 'Build puppet module package'
task :build do
  require 'puppet/face'
  pmod = Puppet::Face['module', :current]
  pmod.build('./')
end

desc 'Run rspec tests'
RSpec::Core::RakeTask.new(:spec) do |task|
  task.pattern = Dir.glob('spec/**/*_spec.rb')
end

task :default => :spec
