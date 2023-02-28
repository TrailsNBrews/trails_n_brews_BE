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
      "id":   trail[:properties][:feature_id].to_s,
      "type": trail[:properties][:type],
      "attributes": {
        "name":        trail[:properties][:name],
        "coordinates": "#{trail[:geometry][:coordinates].last}, #{trail[:geometry][:coordinates].first}",
        "bathrooms":   trail[:properties][:bathrooms]
      }
    }
  end
end
