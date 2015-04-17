module LicenceToBill
  class Deal
    include LicenceToBill::Concerns

    def get_stages
      get_collection(LicenceToBill::Stage, self.stages)
    end
  end
end