VCR.configure do |config|
  config.cassette_library_dir = "#{LicenceToBill.root}/spec/resources/vcr_cassettes"
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
end