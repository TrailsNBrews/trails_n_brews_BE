class OpenBrewService
  def self.find_by_location(latitude,longitude,pages)
    response = conn.get("/breweries?") do |search|
      search.params['by_dist'] = latitude, longitude
      search.params['page'] = pages
    end
    parse_json(response)
  end

  def self.find_brewery(name)
    parse_json(conn.get("/breweries/#{name}"))
  end

  def self.conn   
    Faraday.new('https://api.openbrewerydb.org')
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end