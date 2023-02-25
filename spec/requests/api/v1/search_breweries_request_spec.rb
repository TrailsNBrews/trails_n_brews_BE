require 'rails_helper'

describe 'Search Breweries API' do

  describe '#find_by_location serialized reponse' do
    describe 'happy path-expected response' do
      it 'returns a successful response with the expected top level and attributes keys' do 
        count = 7
        location = "39.7899,-105.204386" 
        get "/api/v1/search_breweries?loc=#{location}&count=#{count}"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        breweries = JSON.parse(response.body, symbolize_names: true)
        expect(breweries).to be_a(Hash)
        expect(breweries[:data]).to be_a(Array)
        expect(breweries[:data].count).to be <=(count)

        breweries[:data].each do |brew|
          expect(brew).to have_key(:type)
          expect(brew).to have_key(:id)
          expect(brew).to have_key(:attributes)

          expect(brew[:attributes]).to have_key(:name)
          expect(brew[:attributes]).to have_key(:city)
          expect(brew[:attributes]).to have_key(:state)
          expect(brew[:attributes]).to have_key(:postal_code)
          expect(brew[:attributes]).to have_key(:longitude)
          expect(brew[:attributes]).to have_key(:latitude)
          expect(brew[:attributes]).to have_key(:website_url)
        end
      end
    end
  end

end