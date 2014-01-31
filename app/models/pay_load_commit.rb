class PayLoadCommit
  attr_accessor :id, :url, :repository_slug

  def initialize(params)
    @id              = params["id"]
    @url             = params["url"]
    @repository_slug = params["repository_slug"]
  end

end
