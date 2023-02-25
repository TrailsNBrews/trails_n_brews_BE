class Api::V1::SearchTrailsController < ApplicationController
  def index
    trails = ColoTrailService.find_by_name(params[:search], params[:count])
    json render: TrailSerializer.format_trails(trails)
  end

  def show
    trail = ColoTrailService.find_by_id(params[:id])
    json render: TrailSerializer.format_trail(trail)
  end
end
