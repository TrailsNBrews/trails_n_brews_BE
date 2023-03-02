Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show]
      resources :search_breweries, only: [:index, :show]
      resources :search_trails, only: [:index, :show]
      resources :user_breweries, only: [:create, :destroy]
      resources :user_trails, only: [:create, :destroy]
      resources :user_accomplishments, only: [:show]
    end
  end
end