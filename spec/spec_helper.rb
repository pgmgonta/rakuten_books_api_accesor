require 'simplecov'
require 'simplecov-rcov'

RSpec.configure do |config|
  config.before(:each) { 
    SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
    SimpleCov.start
  }
end
