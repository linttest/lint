class RepositoriesController < ApplicationController
  before_filter :authenticate_user!

  def index
    usecase       = ListGithubRepositoriesUsecase.new(current_user).execute
    @repositories = usecase.repositories
  end

end
