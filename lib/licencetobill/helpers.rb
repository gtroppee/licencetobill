module LicenceToBill::Helpers
  def get_collection(klass, api_call)
    LicenceToBill::Manager.return_collection(klass, api_call)
  end
end