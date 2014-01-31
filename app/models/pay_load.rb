class PayLoad

  attr_accessor :hook_hash, :repository_name, :repository_url, :sha

  def initialize(params)
    @hook_hash = params
    @repository_name = params["repository"]["name"]
    @repository_url = params["repository"]["url"]
    @sha = params["after"]
  end

  def commits
    @hook_hash["commits"].map do |commit_hash|
      PayLoadCommit.new(commit_hash)
    end
  end

end
