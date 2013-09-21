Cragbrag::Application.routes.draw do

  resources :climbs
  resources :memberships
  resources :users do
    collection do
      get :dashboard
    end
    resources :tags
    resources :climbs, only: :index
  end
  resources :gyms do
    resources :problems
  end

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy', as: :signout

  root 'climbs#new'
end
