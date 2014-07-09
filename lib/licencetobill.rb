module LicenceToBill
  def self.root
    File.dirname __dir__
  end
end

require 'json'
require 'httparty'
require 'vcr'
# require 'pry'
require_relative 'licencetobill/helpers'
require_relative 'licencetobill/api'
require_relative 'licencetobill/concerns'
require_relative 'licencetobill/configuration'
require_relative 'licencetobill/deal'
require_relative 'licencetobill/feature'
require_relative 'licencetobill/manager'
require_relative 'licencetobill/offer'
require_relative 'licencetobill/stage'
require_relative 'licencetobill/user'
require_relative 'licencetobill/user_address'

# require "#{LicenceToBill.root}/config/licencetobill"
# require "#{LicenceToBill.root}/config/vcr"

# @api    = LicenceToBill::API.new
# @offers = @api.get_offers_for(1)
# puts @offers[1].get_stages.first