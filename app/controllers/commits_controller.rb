class CommitsController < ApplicationController
  
  before_filter :load_commit

  def show
    @commit = @db.find_commit(params[:id])
  end

end
