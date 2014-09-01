module LicenceToBill
  class Manager
    def self.return_collection(klass, params)
      unless params.kind_of?(Array)
        return if params.parsed_response.nil?
        params = JSON.parse(params.body) 
      end
      if params.kind_of?(Array)
        params.map { |hash| klass.new(hash) }
      else
        [klass.new(params)]
      end
    end
  end
end