class ListGithubRepositoriesUsecase

  attr_reader :user, :github_adapter, :repositories

  def initialize(user, github_adapter = Github::Adapter.new)
    @user           = user
    @github_adapter = github_adapter
  end

  def execute
    @repositories = github_adapter.get_user_repositories(user.nickname)
  end

end
