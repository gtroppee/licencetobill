class Configuration
  attr_accessor :business_key, :agent_key

  def initialize
    @business_key = 'your_business_key'
    @agent_key    = 'your_agent_key'
  end
end