module LicenceToBill
  class Offer
    include LicenceToBill::Concerns

    def get_stages
      if respond_to?(:stages)
        get_collection(LicenceToBill::Stage, stages)
      else
        []
      end
    end
  end
end