class Api::V1::SearchTrailsController < ApplicationController
  def index
    json render: ColoTrailService.find_by_name(fragment, count)
  end

  def show
  end
end
