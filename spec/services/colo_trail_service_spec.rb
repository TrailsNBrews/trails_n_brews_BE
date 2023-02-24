require 'rails_helper'

RSpec.describe 'Search Index' do
  describe '#find_by_name' do
    it '#find_by_name returns a given number of results with attributes' do
      expect(ColoTrailService.find_by_name('head', 5)).to be_a(Array)
      expect(ColoTrailService.find_by_name('head', 5).first).to be_a(Hash)
      expect(ColoTrailService.find_by_name('head', 5).first[:properties][:name]).to be_a(String)
      expect(ColoTrailService.find_by_name('head', 5).first[:properties][:feature_id]).to be_a(Integer)
      expect(ColoTrailService.find_by_name('head', 5).first[:properties][:place_id]).to be_a(Integer)
      expect(ColoTrailService.find_by_name('head', 5).first[:properties][:type]).to be_a(String)
    end
  end
end
