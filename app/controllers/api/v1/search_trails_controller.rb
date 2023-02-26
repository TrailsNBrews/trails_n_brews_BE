class Api::V1::SearchTrailsController < ApplicationController
  def index
    params[:count] ||= 5
    trails = ColoTrailService.find_by_name(params[:search], params[:count])
    unless trails.empty?
      render json: TrailSerializer.format_trails(trails)
    else
      render json: CommonSerializer.format_empty
    end
  end

  def show
    trail = ColoTrailService.find_by_id(params[:id])
    if trail
      render json: TrailSerializer.format_trail(trail)
    else
      render json: { "errors": "Unable to locate trail" }, status: :not_found
    end
  end
end
