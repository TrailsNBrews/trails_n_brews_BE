class Api::V1::UserTrailsController < ApplicationController
  def create
    trail = Trail.find_by(trail_id: params[:trail_id])
    if trail
      user_trail = UserTrail.new(user_id: params[:user_id].first, trail_id: trail.id)
    else
      Trail.create(trail_id: params[:trail_id], name: params[:trail_name])
      user_trail = UserTrail.new(user_id: params[:user_id].first, trail_id: Trail.last.id)
    end
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