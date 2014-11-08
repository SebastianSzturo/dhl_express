require 'dhl_express'
require 'vcr'

# VCR Setup
VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :typhoeus
end

# RSpec Setup
RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.order = 'random'
end
