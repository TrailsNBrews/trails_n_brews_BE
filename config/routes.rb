Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :api do 
    namespace :v1 do
      resources :search_breweries, only: [:index, :show] do

      end
    end
  end

end
