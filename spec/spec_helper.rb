require 'simplecov'
require 'simplecov-rcov'

RSpec.configure do |config|
  config.before(:all) { 
    puts '[Config] before all'
    SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
    SimpleCov.start
  }
end
