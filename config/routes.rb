Rails.application.routes.draw do
  root to: "static_pages#landing"

  resources :events, only: [:index]

  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"
  delete "/logout", to: 'sessions#destroy', as: :logout

  resources :users, only: [:show]
  resources :feeds, only: [:index]
end
