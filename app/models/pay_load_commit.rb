class PayLoadCommit
  attr_accessor :id, :url

  def initialize(params)
    @id = params["id"]
    @url = params["url"]
  end

end
