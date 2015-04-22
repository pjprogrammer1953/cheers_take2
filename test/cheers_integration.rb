class CheersIntegration
  include Comparable
  attr_accessor :payload
  attr_reader :next_item

  def initialize(data)
    @payload = data
  end

  

end