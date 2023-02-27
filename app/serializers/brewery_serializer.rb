class BrewerySerializer
  def self.multiple_brews_serializer(breweries)
    {
      "data": breweries.map do |brewery|
        { 
            "type": brewery[:brewery_type],
            "id": brewery[:id],
            "attributes": {
                          "name": brewery[:name],
                          "city": brewery[:city],
                          "state": brewery[:state],
                          "postal_code": brewery[:postal_code],
                          "longitude": brewery[:longitude],
                          "latitude": brewery[:latitude],
                          "website_url": brewery[:website_url]
          }
        }  
      end
    }
  end

  def self.single_brew_serializer(brewery)
    { 
      "data": 
      {
            "type": brewery[:brewery_type],
            "id": brewery[:id],
            "attributes": 
            {
                        "name": brewery[:name],
                        "city": brewery[:city],
                        "state": brewery[:state],
                        "postal_code": brewery[:postal_code],
                        "longitude": brewery[:longitude],
                        "latitude": brewery[:latitude],
                        "website_url": brewery[:website_url]
          }
      }
  }
  end

end
