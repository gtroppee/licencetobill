module LicenceToBill
  class Stage
    include LicenceToBill::Concerns

    def get_features
      get_collection(LicenceToBill::Feature, self.features) 
    end
  end
end