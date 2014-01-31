class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    usecase = AuthenticateWithGithubUsecase.new(Db.new, request.env['omniauth.auth'])
    begin
      usecase.execute
      sign_in_and_redirect(usecase.user, :event => :authentication)
      set_flash_message(:notice, :success, :kind => "Github")
    rescue ActiveRecord::RecordInvalid
      redirect_to home_path, :error => "Sorry cannot authenticate"
    end
  end

  private

  def after_sign_in_path_for(user)
    repositories_path
  end
end
