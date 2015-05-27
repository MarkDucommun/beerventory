Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :beers
      resources :breweries
      resources :containers
      resources :locations
      resources :styles
      resources :units
    end
  end

  get "api" => proc { [404, {}, ['Invalid API endpoint']] }
  get "api/*path" => proc { [404, {}, ['Invalid API endpoint']] }

  get "/*path" => redirect("/?goto=%{path}")

  root 'pages#index'
end
