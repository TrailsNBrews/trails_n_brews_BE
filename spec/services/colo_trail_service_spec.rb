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

  describe 'find trail by ID' do
    it '#find_by_id returns an single trail with the ID provided' do
      id = ColoTrailService.find_by_name('head', 1).first[:properties][:feature_id]

      trail = ColoTrailService.find_by_id(id)

      expect(trail).to be_a(Hash)
      expect(trail[:properties][:name]).to be_a(String)
      expect(trail[:properties][:feature_id]).to be_a(Integer)
      expect(trail[:properties][:place_id]).to be_a(Integer)
      expect(trail[:properties][:type]).to be_a(String)
    end
  end
end
