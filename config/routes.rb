Cragbrag::Application.routes.draw do

  resources :memberships
  resources :users
  resources :gyms do
    resources :routes
  end
end
