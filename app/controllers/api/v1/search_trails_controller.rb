class Api::V1::SearchTrailsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_response
  # rescue_from nil_error, with: :error_response

  def error_response(error)
    binding.pry
    # render json: ErrorSerializer.error_json(error), status: 404
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
    trail = TrailsFacade.trail_with_breweries(params[:id])
    # binding.pry
    if trail
      render json: TrailSerializer.format_trail_with_breweries(trail)
    else
      # raise nil_error
      render json: { "errors": "Unable to locate trail" }, status: :not_found
    
      # render json: ErrorSerializer.new(error)
    end
    
    
    # trail = TrailsFacade.trail_with_breweries(params[:id])
    # if trail
    #   render json: TrailSerializer.format_trail_with_breweries(trail)
    # else
    #   render json: { "errors": "Unable to locate trail" }, status: :not_found
    # end
  end
end
