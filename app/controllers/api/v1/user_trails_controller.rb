class Api::V1::UserTrailsController < ApplicationController
  def create
    UserTrail.create(user_id: params[:user], trail_id: params[:trail]) 
  end
end