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
require 'scrutinizer/ocular'
Scrutinizer::Ocular.watch!


ActiveSupport::Deprecation.behavior = lambda do |msg, stack|
  # when running this test suite ignore our own deprecation warnings
  unless /use AuthorizeNet::API::Transaction/ =~ msg
    ActiveSupport::Deprecation::DEFAULT_BEHAVIORS[:stderr].call(msg,stack)
  end
end

Dir['./spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.include SharedHelper
end
