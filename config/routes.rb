Rails.application.routes.draw do
  root to: 'users#home'

  get '/dogs', to: 'dogs#index', as: 'dogs'

  resources :users do
    resources :playdates, shallow: true
    resources :dogs, shallow: true, except: (:index)
  end

  get     '/login',    to: 'sessions#new'
  post    '/login',    to: 'sessions#create'
  delete  '/logout',   to: 'sessions#destroy'

end
