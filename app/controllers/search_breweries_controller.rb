class SearchBreweriesController < ApplicationController
  def index
    OpenBrewService.find_by_location(location,count)
  end

  def show
  end

end