class Api::V1::SearchTrailsController < ApplicationController
  def index
    params[:count] ||= 5
    trails = ColoTrailService.find_by_name(params[:search], params[:count])
    render json: TrailSerializer.format_trails(trails)
  end

  def show
    trail = ColoTrailService.find_by_id(params[:id])
    render json: TrailSerializer.format_trail(trail)
  end
end
