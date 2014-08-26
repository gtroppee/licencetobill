require 'spec_helper'

describe LicenceToBill::API do  

  before { @api = LicenceToBill::API.new }

  describe 'Users' do
    it '#get_users', :vcr do
      users = @api.get_users
      user  = users.first
      expect(users).to be_a(Array)
      expect(user).to be_a(LicenceToBill::User) if user
    end

    it '#get_user', :vcr do
      user = @api.get_user(1)
      expect(user).to be_a(LicenceToBill::User) if user
    end

    it '#get_user_for', :vcr do
      key_feature = @api.get_features.first.key_feature
      users       = @api.get_users_for(key_feature)
      user        = users.first
      expect(users).to be_a(Array)
      expect(user).to be_a(LicenceToBill::User) if user
    end

    it '#get_billing_address_for', :vcr do
      user    = @api.get_users.select{|u| u.key_user == '1'}.first
      address = @api.get_billing_address_for(user.key_user)
      expect(address).to be_a(LicenceToBill::UserAddress) if address
      expect(user.name_user).to eq(address.fullname) if address
    end
  end

  describe 'Features' do
    it '#get_features', :vcr do
      features = @api.get_features
      feature = features.first
      expect(features).to be_a(Array)
      expect(feature).to be_a(LicenceToBill::Feature) if feature
    end

    it '#get_features_for', :vcr do
      user = @api.get_user(1)
      features = @api.get_features_for(user.key_user)
      feature = features.first
      expect(features).to be_a(Array)
      expect(feature).to be_a(LicenceToBill::Feature) if feature
    end

    it '#get_features_details_for', :vcr do
      user = @api.get_user(1)
      features = @api.get_features
      feature = features.first
      restriction = @api.get_features_details_for(feature.key_feature, user.key_user)
      expect(features).to be_a(Array)
      expect(feature).to be_a(LicenceToBill::Feature) if feature
    end
  end

  describe 'Offers' do
    it '#get_offers', :vcr do
      offers = @api.get_offers
      offer = offers.first
      expect(offers).to be_a(Array)
      expect(offer).to be_a(LicenceToBill::Offer) if offer
    end

    it '#get_offers_for', :vcr do
      user = @api.get_user(1)
      offers = @api.get_offers_for(user.key_user)
      offer = offers.first
      expect(offers).to be_a(Array)
      expect(offer).to be_a(LicenceToBill::Offer) if offer
    end

    it '#features', :vcr do
      user = @api.get_user(1)
      offers = @api.get_offers_for(user.key_user)
      offer = offers[1]
      expect(offer.features).to be_a(Array)
      expect(offer.features.first).to be_a(LicenceToBill::Feature) if offer
    end
  end

end