require 'bundler/setup'
require 'utilities'
require 'vcr'
require 'webmock/rspec'
require 'licencetobill' # and any other gems you need
Bundler.setup

RSpec.configure do |config|
  config.around(:each, :vcr) do |example|
    name = example.metadata[:full_description].split(/\s+/)[-1]
    VCR.use_cassette(name) { example.call }
  end
end