module LicenceToBill
  class Manager
    def self.return_collection(klass, params)
      return if params.parsed_response.nil?
      params = JSON.parse(params.body) unless params.kind_of?(Array)
      if params.kind_of?(Array)
        params.map { |hash| klass.new(hash) }
      else
        [klass.new(params)]
      end
    end
  end
end