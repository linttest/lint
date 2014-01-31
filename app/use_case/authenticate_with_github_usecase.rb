class AuthenticateWithGithubUsecase

  attr_reader :db, :auth, :user

  def initialize(db, auth)
    @db   = db
    @auth = auth
  end

  def execute
    @user = db.find_github_user(auth.uid) || make_github_user(auth)
  end

  def make_github_user(auth)
    db.make_github_user(
      provider:   auth.provider,
      uid:        auth.uid,
      email:      auth.info.email,
      password:   Devise.friendly_token.first(20),
      name:       auth.info.name,
      avatar_url: auth.info.image
    )
  end

end
