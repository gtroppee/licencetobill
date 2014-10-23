module LicenceToBill
  class Manager
    def self.return_collection(klass, params)
      if params.kind_of?(Array)
        params.map { |hash| klass.new(hash) }
      else
        return [] if params.parsed_response.nil? || params.parsed_response['Status'] === 404
        params = JSON.parse(params.body)
        [klass.new(params)]
      end
    end
  end
end