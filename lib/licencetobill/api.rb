module LicenceToBill
  class << self
    attr_accessor :configuration
  end

  class API
    attr_accessor :token, :base_uri

    def initialize(business_key = LicenceToBill.configuration.business_key, agent_key = LicenceToBill.configuration.agent_key)
      @business_key = business_key
      @agent_key    = agent_key
      @token        = set_token

      # DEFAULTS
      @base_uri = 'https://api.licencetobill.com/v2'
    end

    # USERS
    def get_users
      get_collection(LicenceToBill::User, call_to("/users"))
    end

    def get_user(key_user)
      get_collection(LicenceToBill::User, call_to("/users/#{key_user}"))
    end

    def get_users_for(key_feature)
      get_collection(LicenceToBill::User, call_to("/users/features/#{key_feature}"))
    end

    def get_billing_address_for(key_user)
      get_collection(LicenceToBill::UserAddress, call_to("/address/users/#{key_user}"))
    end

    def register_user(key_user, name_user)
      call_to("/users/#{key_user}", :post, { key_user: "#{key_user}", name_user: "#{name_user}" })
    end

    # FEATURES
    def get_features(lcid = nil)
      get_collection(LicenceToBill::Feature, call_to("/features/#{lcid}"))
    end

    def get_features_for(key_user)
      get_collection(LicenceToBill::Feature, call_to("/features/users/#{key_user}"))
    end

    def get_features_details_for(key_feature, key_user)
      get_collection(LicenceToBill::Feature, call_to("/features/#{key_feature}/users/#{key_user}"))
    end

    # OFFERS
    def get_offers(lcid = nil)
      get_collection(LicenceToBill::Offer, call_to("/offers/#{lcid}"))
    end

    def get_offers_for(key_user)
      get_collection(LicenceToBill::Offer, call_to("/offers/users/#{key_user}"))
    end

    # DEALS
    def get_deals_for(key_user)
      get_collection(LicenceToBill::Deal, call_to("/deals/users/#{key_user}"))
    end

    def add_trial_for(key_user)
      call_to("/trial/#{key_user}", :post)
    end

    protected
      def set_token
        token = Base64.encode64("#{@business_key}:#{@agent_key}").delete!("\n")
        "Basic #{token}"
      end

      def call_to(endpoint, method = :get, params = {})
        HTTParty.send(method, 
                      "#{@base_uri}#{endpoint}", 
                      headers: { "Authorization" => @token, 'Content-Type' => "application/json" },
                      body: params.to_json)
      end

      def get_collection(klass, api_call)
        LicenceToBill::Manager.return_collection(klass, api_call)
      end
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end