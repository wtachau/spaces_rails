Rails.application.routes.draw do

  match '*all', to: 'application#preflight', via: [:options]
  resources :projects, only: [:index]
  get 'user', to: 'users#user'

end
