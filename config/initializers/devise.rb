Devise.setup do |config|
  config.secret_key = '39b8fbb349709f8d7ceb16c9338b4916209f3576132898e613e4dbf99f52fcc492433310c79a96c8a56c995d1f56e89271689b8bf81e6d06cde23db533c0726e'
  config.mailer_sender = 'lint@notdomainyet.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  config.omniauth :github, ENV['GITHUB_ID'], ENV['GITHUB_SECRET'], :scope => 'user,public_repo'
end
