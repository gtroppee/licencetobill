module LicenceToBill
  class Offer
    include LicenceToBill::Concerns

    def get_features
      get_collection(LicenceToBill::Feature, self.stages[0]['features']) 
    end

    def get_stages
      get_collection(LicenceToBill::Stage, self.stages)
    end
  end
end