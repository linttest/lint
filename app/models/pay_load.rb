class PayLoad

  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def commits
    hook_hash[:commits].map do |commit_hash|
      PayLoadCommit.new(commit_hash)
    end
  end

  def repository_name
    @repository_name ||= hook_hash[:repository][:name]
  end

  def repository_url
    @repository_url ||= hook_hash[:repository][:url]
  end

  def hook_hash
    @hook_hash ||= JSON.parse(params).with_indifferent_access
  end

  def sha
    @sha ||= hook_hash[:after]
  end

end
