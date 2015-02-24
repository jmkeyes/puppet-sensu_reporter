require 'bundler/setup'
require 'rspec/core/rake_task'
require 'puppet_blacksmith/rake_tasks'
require 'puppetlabs_spec_helper/rake_tasks'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.pattern = Dir.glob('spec/**/*_spec.rb')
end

task :default => :spec
