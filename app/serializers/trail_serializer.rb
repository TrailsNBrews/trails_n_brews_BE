class TrailSerializer
  def self.format_trails(trails)
    {
      "data": trails.map do |trail|
        trail_properties(trail)
      end
    }
  end

  def self.format_trail(trail)
    {
      "data": [trail_properties(trail)]
    }
  end

  def self.trail_properties(trail)
    {
      "id":     trail[:properties][:feature_id].to_s,
      "co_id":  trail[:properties][:place_id].to_s,
      "type":   trail[:properties][:type],
      "attributes": {
        "name":        trail[:properties][:name],
        "latitude":    trail[:geometry][:coordinates].last.to_s, 
        "longitude":   trail[:geometry][:coordinates].first.to_s,
        "bathrooms":   trail[:properties][:bathrooms]
      }
    }
  end

  def self.format_trail_with_breweries(trail)
    {
      "data":{"trail": trail_properties(trail[:trail]),
             "breweries": trail[:breweries].map do |brewery|
                { 
                  "type": brewery[:brewery_type],
                  "id": brewery[:id],
                  "attributes": {
                                "name": brewery[:name],
                                "street": brewery[:street],
                                "city": brewery[:city],
                                "state": brewery[:state],
                                "postal_code": brewery[:postal_code],
                                "phone": brewery[:phone],
                                "longitude": brewery[:longitude],
                                "latitude": brewery[:latitude],
                                "website_url": brewery[:website_url]
                  }
                }
              end
            }
    }
  end
end
