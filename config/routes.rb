Rails.application.routes.draw do

  get 'sessions/new'

  post 'sessions/create', to: 'sessions#create'

  delete '/logout' => 'sessions#destroy', as: 'logout'

  get '/logout' => 'sessions#destroy'

  get 'users/signup', to: 'users#new', as: 'user/signup'
  resources :users, only: [:index, :show, :update, :destroy, :edit, :create]
  resources :attractions
  # get 'attractions/index'
  #
  # get 'attractions/new'
  #
  # get 'attractions/edit'
  #
  # get 'attractions/show'
  #
  # get 'attractions/create'
  #
  # get 'attractions/update'
  #
  # get 'attractions/destroy'
  #
  # get 'users/index'
  #
  # get 'users/new'
  #
  # get 'users/edit'
  #
  # get 'users/show'
  #
  # get 'users/create'
  #
  # get 'users/update'
  #
  # get 'users/destroy'

end
