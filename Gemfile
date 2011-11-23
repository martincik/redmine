source :rubygems

gem "bundler"
gem "rails", "2.3.11"
gem "rack"
gem "rubytree", "0.5.2", :require => "tree"
gem "RedCloth", "~>4.2.3", :require => "redcloth"
gem "mysql"
gem 'whenever'
gem 'backup', '~>3.0.16'
gem 'mail'
gem 'fog', '~>0.7.0'

# backlogs plugin
gem 'holidays'
gem 'icalendar'
gem 'prawn'

group :development do
  gem 'capistrano'
  gem 'capistrano-ext'
end

group :test do
  gem "shoulda"
  gem "mocha", :require => nil # ":require => nil" fixes obscure bugs - remote and run all tests
  gem "edavis10-object_daddy", :require => "object_daddy"
end

# Load plugins' Gemfiles
Dir.glob(File.join(File.dirname(__FILE__), %w(vendor plugins * Gemfile))) do |file|
  puts "Loading #{file} ..."
  instance_eval File.read(file)
end

