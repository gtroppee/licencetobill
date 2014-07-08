#encoding: utf-8
Gem::Specification.new do |s|
  s.name        = 'licencetobill'
  s.version     = '0.1.0'
  s.date        = '2014-07-08'
  s.summary     = "A simple ruby wrapper for the LicenceToBill private API"
  s.authors     = "Guillaume Troppée"
  s.email       = 'gtroppee@gmail.com'
  s.files       = Dir["README.md","Gemfile", "spec/*", "lib/**/*"]
  s.homepage    ='http://rubygems.org/gems/licencetobill'
  s.license     = 'MIT'

  s.add_development_dependency "rspec"
  s.add_dependency             "httparty"
  s.add_dependency             "vcr"
  s.add_dependency             "addressable"
  s.add_dependency             "webmock"
end