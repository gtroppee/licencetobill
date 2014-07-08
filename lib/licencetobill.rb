module LicenceToBill
  def self.root
    File.dirname __dir__
  end
end

require 'json'
require 'httparty'
require 'vcr'
require_relative 'licencetobill/api'
require_relative 'licencetobill/concerns'
require_relative 'licencetobill/configuration'
require_relative 'licencetobill/deal'
require_relative 'licencetobill/feature'
require_relative 'licencetobill/manager'
require_relative 'licencetobill/offer'
require_relative 'licencetobill/user'
require_relative 'licencetobill/user_address'

# require "#{LicenceToBill.root}/config/licencetobill"
require "#{LicenceToBill.root}/config/vcr"