Cragbrag::Application.routes.draw do

  resources :climbs

  resources :memberships
  resources :users do
    resources :climbs, only: :index
  end
  resources :gyms do
    resources :routes
  end
end
