class BrewerySerializer
  def self.location_serializer(breweries)
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

end