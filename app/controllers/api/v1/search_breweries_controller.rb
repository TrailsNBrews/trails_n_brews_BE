class Api::V1::SearchBreweriesController < ApplicationController
  def index
    count = params[:count]

    if params[:loc]
      breweries = OpenBrewService.find_by_location(params[:loc], count)
    else
      breweries = OpenBrewService.find_brewery_by_name(params[:name], count)
    end
  # require 'pry';binding.pry
    render json: BrewerySerializer.multiple_brews_serializer(breweries)
  
  end

  def show
  end
end
