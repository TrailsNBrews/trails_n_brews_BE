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
    trail = TrailsFacade.trail_with_breweries(params[:id])
    # binding.pry
    raise RecordError.new(details: 'Unable to locate trail') unless trail = nil
      render json: TrailSerializer.format_trail_with_breweries(trail)
    # trail = TrailsFacade.trail_with_breweries(params[:id])
    # # binding.pry
    # # if trail
    #   render json: TrailSerializer.format_trail_with_breweries(trail)
    # # else
    # #   render json: { "errors": "Unable to locate trail" }, status: :not_found
    # # 
    # #   # render json: ErrorSerializer.new(error)
    # # end
    
    
    # trail = TrailsFacade.trail_with_breweries(params[:id])
    # if trail
    #   render json: TrailSerializer.format_trail_with_breweries(trail)
    # else
    #   render json: { "errors": "Unable to locate trail" }, status: :not_found
    # end
  end
end
