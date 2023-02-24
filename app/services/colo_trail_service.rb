class ColoTrailService
  def self.find_by_name(fragment, count)
    found_trails = parse_json[:features].select { |feature| feature[:properties][:name].include?(fragment) }
    found_trails.first(count)
  end

  def self.parse_json
    JSON.parse(File.read('db/data/Trailheads_COTREX02152023.json'), symbolize_names: true)
  end
end