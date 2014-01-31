class AnalyzeCodeChangeUsecase

  attr_reader :payload, :analyzer, :github_adapter

  def initialize(payload, analyzer, github_adapter)
    @payload        = payload
    @analyzer       = analyzer
    @github_adapter = github_adapter
  end

  def execute
    payload.commits.each do |commit|
      files = github_adapter.get_commit_files(commit)
      result = analyzer.execute(files)
      github_adapter.publish_commit_status(commit, result)
    end
  end

end
