module LicenceToBill
  class Manager
    def self.return_collection(klass, params)
      params = JSON.parse(params.body)
      if params.kind_of?(Array)
        params.map { |hash| klass.new(hash) }
      else
        klass.new(params)
      end
    end
  end
end