class Api::V1::UserBreweriesController < ApplicationController
  def create
    brewery = Brewery.find_by(brew_id: params[:brew_id])
    if brewery
      user_brewery = UserBrewery.new(user_id: params[:user_id].first, brewery_id: brewery.id)
    else
      Brewery.create(brew_id: params[:brew_id], name: params[:brew_name])
      user_brewery = UserBrewery.new(user_id: params[:user_id].first, brewery_id: Brewery.last.id)
    end
    if user_brewery.save
      render json: { "success": "User brewery added successfully" }, status: 201
    else
      render json: { "errors": user_brewery.errors.full_messages.to_sentence }, status: 400
    end 
  end

  def destroy
    user_brewery = UserBrewery.find(params[:id]) 
    user_brewery.destroy
  end
end