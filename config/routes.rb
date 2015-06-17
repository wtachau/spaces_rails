Rails.application.routes.draw do

  get 'projects/new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'spaces#home'

  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  get 'user', to: 'users#user'

  resources :projects

end
