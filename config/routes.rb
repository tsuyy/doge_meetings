Rails.application.routes.draw do

  root to: 'users#home'

  resources :users

  get     '/login',    to: 'sessions#new'
  post    '/login',    to: 'sessions#create'
  delete  '/logout',   to: 'sessions#destroy'

end
