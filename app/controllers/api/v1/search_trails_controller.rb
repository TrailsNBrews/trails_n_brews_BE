class Api::V1::SearchTrailsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_response
  
  def error_response(error)
    # binding.pry
    render json: ErrorSerializer.error_json(error), status: 404
  end
  
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
    # binding.pry
    # if trail
      render json: TrailSerializer.format_trail(trail)
    # else
    #   render json: { "errors": "Unable to locate trail" }, status: :not_found
    # 
    #   # render json: ErrorSerializer.new(error)
    # end
  end
end
