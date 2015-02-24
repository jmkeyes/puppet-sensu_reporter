source 'https://rubygems.org'

group :rake, :test do
  gem 'rake',                   '~> 10.4.2'
  gem 'rspec',                  '~> 3.2.0'
end

group :rake, :development do
  gem 'travis',            '~> 1.7.5'
  gem 'puppet-blacksmith', '~> 3.1.1'
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', '~> 3.6.0', :require => false
end
