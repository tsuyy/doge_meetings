Rails.application.routes.draw do
  root to: 'users#home'

  resources :users do
    resources :playdates, shallow: true
    resources :dogs, shallow: true
  end

  get     '/login',    to: 'sessions#new'
  post    '/login',    to: 'sessions#create'
  delete  '/logout',   to: 'sessions#destroy'

end
