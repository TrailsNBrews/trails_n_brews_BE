class SearchBreweriesController < ApplicationController
  def index
    result = OpenBrewService.find_by_location(location,count)
    require 'pry';binding.pry
  end

  def show
  end

end