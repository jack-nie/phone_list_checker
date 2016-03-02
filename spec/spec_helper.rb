require 'rspec'
require_relative '../lib/phone_list_checker'

::SPEC_ROOT = File.dirname __FILE__

RSpec.configure do |config|
  config.order = :random
  config.run_all_when_everything_filtered = true
  config.raise_errors_for_deprecations!
end
