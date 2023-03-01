class Api::V1::UserBreweriesController < ApplicationController
  def create
    UserBrewery.create(user_id: params[:user], brewery_id: params[:brewery]) 
  end
end