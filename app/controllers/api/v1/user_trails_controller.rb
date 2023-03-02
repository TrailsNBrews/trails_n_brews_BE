class Api::V1::UserTrailsController < ApplicationController
  def create
    user_trail = UserTrail.create(user_id: params[:user], trail_id: params[:trail]) 
    if user_trail.save
      render json: { "success": "User trail added successfully" }, status: 201
    else
      render json: { "errors": user_trail.errors.full_messages.to_sentence }, status: 400
    end 
  end

  def destroy
    user_trail = UserTrail.find(params[:id])
    user_trail.destroy
  end
end