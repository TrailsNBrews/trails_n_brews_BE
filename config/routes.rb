Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # namespace api
  #   namespace v1
      
  resources :search_breweries, only: [:index, :show]

end
