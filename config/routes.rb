Rails.application.routes.draw do
  root to: "static_pages#landing"

  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"
  delete "/logout", to: 'sessions#destroy', as: :logout

  resources :users, only: [:show]
end
