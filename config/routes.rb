Rails.application.routes.draw do
  resources :users do
    resources :playdates, shallow: true
  end

  get     '/login',    to: 'sessions#new'
  post    '/login',    to: 'sessions#create'
  delete  '/logout',   to: 'sessions#destroy'

end
