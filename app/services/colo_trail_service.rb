class ColoTrailService
  def self.find_by_name(fragment, count = 5)
    found_trails = parse_json[:features].select do |feature|
      feature[:properties][:name].downcase.include?(fragment.downcase)
    end
    found_trails.first(count.to_i)
  end

  def self.find_by_id(id)
    parse_json[:features].find { |feature| feature[:properties][:feature_id] == id }
  end

  def self.parse_json
    JSON.parse(File.read('db/data/Trailheads_COTREX02152023.json'), symbolize_names: true)
  end
end
