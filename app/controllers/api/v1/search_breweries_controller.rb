class Api::V1::SearchBreweriesController < ApplicationController
  def index
    count = params[:count]
    if params[:loc]
      breweries = OpenBrewService.find_by_location(params[:loc], count)
    else
      breweries = OpenBrewService.find_brewery_by_name(params[:name], count)
    end
    render json: BrewerySerializer.multiple_brews_serializer(breweries)
  end

  def show
    brewery = OpenBrewService.find_brewery_by_id(params[:id])
    render json: BrewerySerializer.single_brew_serializer(brewery)
  end
end
