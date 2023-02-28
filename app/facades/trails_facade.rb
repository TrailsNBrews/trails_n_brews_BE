class TrailsFacade
  def self.trail_with_breweries(id)
    trail = ColoTrailService.find_by_id(id)
    coordinates = trail[:geometry][:coordinates]
    location = "#{coordinates[0]},#{coordinates[1]}"
    breweries = OpenBrewService.find_by_location(location)
    binding.pry
  end
end