Lint::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: "home#index"
  resources :repositories, only: [:index]
  resources :commits, only: [:show]
  
  post '/git_statuses/process_commit', to: 'git_statuses#process_commit'
end
