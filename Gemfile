source :rubygems

gem "bundler"
gem "rails", "2.3.5"
gem "rack", "1.0.1"
gem "rubytree", "0.5.2", :require => "tree"
gem "RedCloth", "~>4.2.3", :require => "redcloth"
gem "mysql"

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

