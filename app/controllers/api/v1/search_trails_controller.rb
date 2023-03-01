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

    raise RecordError.new(details: 'Unable to locate trail') unless trail

    render json: TrailSerializer.format_trail_with_breweries(trail)
  end
end
