class Db

  def find_github_user(uid)
    User.where(:provider => "github", :uid => uid).take
  end

  def make_github_user(attributes)
    User.create!(attributes)
  end

  def find_commit(sha)
    Commit.find_by(sha: sha)
  end

end
