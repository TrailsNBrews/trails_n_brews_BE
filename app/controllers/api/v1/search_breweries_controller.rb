class Api::V1::SearchBreweriesController < ApplicationController
  def index
    # require 'pry';binding.pry
    location = params[:loc]
    count = params[:count]
    
    brews_by_location = OpenBrewService.find_by_location(location,count)
    # require 'pry';binding.pry
    render json: BrewerySerializer.location_serializer(brews_by_location)
  end

  def show
  end
end
