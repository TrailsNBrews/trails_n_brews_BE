require 'rails_helper'

describe 'Search Trails API' do
  describe '#find_by_name' do
    it 'returns a successful response with the expected top level and attributes keys' do
      get '/api/v1/search_trails?search=head&count=2'

      expect(response).to be_successful

      trails = JSON.parse(response.body, symbolize_names: true)
      expect(trails).to be_a(Hash)
      expect(trails[:data]).to be_a(Array)
      expect(trails[:data].count).to eq(2)

      trails[:data].each do |trail|
        expect(trail).to have_key(:type)
        expect(trail).to have_key(:id)
        expect(trail).to have_key(:attributes)
        expect(trail[:attributes]).to have_key(:name)
      end
    end
  end
end
