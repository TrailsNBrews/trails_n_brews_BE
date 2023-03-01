class UserAccomplishmentsSerializer 
  def self.accomplishments(collection)
    binding.pry
    {
      "data":{"trail":  {
        "name":   trails[:properties][:feature_id].to_s,
        "type": trail[:properties][:type],
        "attributes": {
          "name":        trail[:properties][:name],
          "coordinates": "#{trail[:geometry][:coordinates].last}, #{trail[:geometry][:coordinates].first}",
          "bathrooms":   trail[:properties][:bathrooms]
        }
      },
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