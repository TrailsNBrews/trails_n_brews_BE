require 'rails_helper'

RSpec.describe TrailsFacade do
  describe "#trail_with_breweries" do
    it "returns a json with the trail info for the given ID and an array of breweries nearby" do
      trail = TrailsFacade.trail_with_breweries("61519")

      expect(trail).to be_a(Hash)
      expect(trail).to have_key(:trail)
      expect(trail).to have_key(:breweries)
      expect(trail[:trail]).to have_key(:geometry)
      expect(trail[:trail][:geometry]).to have_key(:coordinates)
      expect(trail[:trail]).to have_key(:properties)
      expect(trail[:trail][:properties]).to have_key(:feature_id)
      expect(trail[:trail][:properties]).to have_key(:name)
      expect(trail[:trail][:properties]).to have_key(:bathrooms)
      expect(trail[:trail][:properties]).to have_key(:water)
      
      trail[:breweries].each do |brewery|
        expect(brewery).to have_key(:id)
        expect(brewery).to have_key(:name)
        expect(brewery).to have_key(:brewery_type)
        expect(brewery).to have_key(:street)
        expect(brewery).to have_key(:city)
        expect(brewery).to have_key(:postal_code)
        expect(brewery).to have_key(:longitude)
        expect(brewery).to have_key(:latitude)
        expect(brewery).to have_key(:phone)
      end
    end
  end
end