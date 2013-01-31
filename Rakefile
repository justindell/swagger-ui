# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "swagger-ui"
  gem.homepage = "http://github.com/justindell/swagger"
  gem.license = "MIT"
  gem.summary = %Q{Swagger UI}
  gem.description = %Q{Swagger UI wrapper}
  gem.email = "dell.justin@gmail.com"
  gem.authors = ["Justin Dell", "Brian Tatnall"]
end
Jeweler::RubygemsDotOrgTasks.new
