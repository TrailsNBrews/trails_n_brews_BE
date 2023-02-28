require 'rails_helper'

RSpec.describe TrailsFacade do
  describe "#trail_with_breweries" do
    it "returns a json with the trail info for the given ID and an array of breweries nearby" do
      trail = TrailsFacade.trail_with_breweries("61519")

      expect(trail).to be_a(Hash)
    end
  end
end