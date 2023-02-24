Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :search_breweries, only: [:index, :show]
      resources :search_trails, only: [:index, :show]
    end
  end
end
