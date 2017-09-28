require 'simplecov'
require 'coveralls'

Coveralls.wear!

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
])

SimpleCov.start do
  add_filter '_spec.rb'
end

require 'authorizenet'
require 'yaml'

Dir['./spec/support/**/*.rb'].each{ |f| require f }

RSpec.configure do |config|
  config.include SharedHelper
end
