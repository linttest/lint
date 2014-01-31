class GitStatusesController < ApplicationController
  def process_commit
    pay_load = PayLoad.new(params[:payload])
    AnalyzeCodeChangeUsecase.new(pay_load).execute
    
    render nothing: true
  end
end
