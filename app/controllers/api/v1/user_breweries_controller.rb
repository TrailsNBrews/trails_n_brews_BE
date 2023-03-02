class Api::V1::UserBreweriesController < ApplicationController
  def create
    user_brewery = UserBrewery.new(user_id: params[:user], brewery_id: params[:brewery])
    if user_brewery.save
      render json: { "success": "User brewery added successfully" }, status: 201
    else
      render json: { "errors": user_brewery.errors.full_messages.to_sentence }, status: 400
    end 
  end
end