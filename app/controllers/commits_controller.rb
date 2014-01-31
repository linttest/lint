class CommitsController < ApplicationController
  
  def show
    @commit = @db.find_commit(params[:id])
  end

end
