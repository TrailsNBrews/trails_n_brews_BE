class TrailsFacade
  def self.trail_with_breweries(id)
    trail = ColoTrailService.find_by_id(id)
    coordinates = trail[:geometry][:coordinates]
    location = "#{coordinates[1]},#{coordinates[0]}"
    breweries = OpenBrewService.find_by_location(location)
    combined = {"trail": trail, "breweries": breweries}
  end
end