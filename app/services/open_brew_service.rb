class OpenBrewService
  def self.find_by_location(location, count = 5)
    response = conn.get("/breweries?") do |search|
      search.params['by_dist'] = location
      search.params['per_page'] = count
    end
    parse_json(response)
  end

  def self.find_brewery(name, count = 5)
    response = conn.get("/breweries") do |search|
      search.params['by_state'] = 'colorado'
      search.params['by_name'] = name
      search.params['per_page'] = count
    end
    parse_json(response)
  end

  def self.find_brewery_by_id(id)
    parse_json(conn.get("/breweries/#{id}"))
  end

  def self.conn
    Faraday.new('https://api.openbrewerydb.org')
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
