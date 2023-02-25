class Api::V1::SearchTrailsController < ApplicationController
  def index
    json render: ColoTrailService.find_by_name(params[:search], params[:count])
  end

  def show
    json render: ColoTrailService.find_by_id(params[:id])
  end
end
