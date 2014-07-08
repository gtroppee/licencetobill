module LicenceToBill
  module Concerns
    def initialize(data_source)
      @data_source = data_source
    end

    def method_missing(method_name)
      super unless @data_source.has_key?("#{method_name}")
      @data_source["#{method_name}"]
    end

    def respond_to_missing?(method_name, include_private = false)
      @data_source.has_key?("#{method_name}") || super
    end
  end
end