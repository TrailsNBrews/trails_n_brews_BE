require 'rails_helper'

RSpec.describe 'Search Index' do
  describe 'find brewery by location coordinates' do
    it '#find_by_location returns a given number of results with attributes' do
      location = "39.7392,-104.9903"
      count = 5
      data = OpenBrewService.find_by_location(location,count)
      expect(data).to be_a(Array)
      expect(data.count).to eq(count)
      expect(data[0]).to be_a(Hash)
      expect(data[0]).to have_key(:id)
      expect(data[0]).to have_key(:name)
      expect(data[0]).to have_key(:city)
      expect(data[0]).to have_key(:longitude)
      expect(data[0]).to have_key(:latitude)
      expect(data[0][:name]).to be_a(String)
      expect(data[0][:city]).to eq('Denver')
    end
  end

  describe 'find brewery by name' do
    it '#find_brewery returns brewery by provided name' do
      name = 'odell'
      count = 5
      data = OpenBrewService.find_brewery(name, count)
      expect(data).to be_a(Array)
      expect(data.count).to be <=(count)
      expect(data[0]).to be_a(Hash)
      expect(data[0]).to have_key(:id)
      expect(data[0]).to have_key(:city)
      expect(data[0]).to have_key(:longitude)
      expect(data[0]).to have_key(:latitude)
      expect(data[0][:name]).to be_a(String)
      expect(data[0][:state]).to eq('Colorado')
      expect(data[0][:name].downcase).to include(name.downcase)
    end
  end
end
