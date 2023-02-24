class TrailSerializer
  def self.format_trails(trails)
    {
      data: trails.map do |trail|
        {
          id:   trail[:properties][:feature_id],
          type: trail[:properties][:type],
          attributes: {
            name: trail[:properties][:name]
          }
        }
      end
    }
  end
end
