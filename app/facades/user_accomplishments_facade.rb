class UserAccomplishmentsFacade
  def self.accomplishments(user_id)
    user = User.find(user_id)
    breweries = user.breweries.map do |brewery|
      {brewery_id: brewery.brew_id, name: brewery.name}
    end
    trails = user.trails.map do |trail|
      {trail_id: trail.trail_id, name: trail.name}
    end
    {user: {user_id: user.id, first_name: user.first_name, last_name: user.last_name, breweries: breweries, trails: trails}}
  end
end