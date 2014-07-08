module LicenceToBill
  class Offer
    include LicenceToBill::Concerns

    def features
      get_collection(LicenceToBill::Feature, self.stages[0]['features']) 
    end
  end
end