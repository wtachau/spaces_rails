Rails.application.routes.draw do

  match '*all', to: 'application#preflight', via: [:options]
  resources :projects, only: [:index, :show]
  get 'user', to: 'users#user'

  # All routes intended for frontend will go to the bundle.js served by webpack
  match '*all', to: 'application#index', via: [:get]

end
