Rails.application.routes.draw do

  root          to: 'users#home'
  get  '/dogs', to: 'dogs#index', as: 'dogs'

  resources :users,       except: [:index] do
    resources :playdates, only:   [:destroy, :update, :create, :new, :edit], shallow: true
    resources :dogs,      except: [:index, :show],                           shallow: true
  end

  post  '/invites',    to: 'invites#create', as: 'new_invite'
  patch '/invites',    to: 'invites#update', as: 'edit_invite'

  get     '/login',    to: 'sessions#new'
  post    '/login',    to: 'sessions#create'
  # i would also make this work for get
  delete  '/logout',   to: 'sessions#destroy'

  match "*path", to: 'application#page_not_found', via: :all

end
