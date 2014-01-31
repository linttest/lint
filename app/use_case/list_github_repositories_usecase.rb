class ListGithubRepositoriesUsecase

  attr_reader :user, :repository_db, :repositories

  def initialize(user, repository_db = Github::Repository.new)
    @user          = user
    @repository_db = repository_db
  end

  def execute
    @repositories = repository_db.for_user(user.nickname)
  end

end
