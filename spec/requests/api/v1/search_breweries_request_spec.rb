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

      it 'attribute keys are the expected datatypes' do
        count = 7
        location = "39.737018,-104.204386" 
        get "/api/v1/search_breweries?loc=#{location}&count=#{count}"
        
        breweries = JSON.parse(response.body, symbolize_names: true)
        
        breweries[:data].each do |brew|
          expect(brew[:attributes][:name]).to be_a(String)
          expect(brew[:attributes][:city]).to be_a(String)
          expect(brew[:attributes][:state]).to be_a(String)
          expect(brew[:attributes][:longitude]).to be_a(String)
          expect(brew[:attributes][:latitude]).to be_a(String)
          expect(brew[:attributes][:website_url]).to be_a(String) unless brew[:attributes][:website_url].nil?
        end
      end

    end
  end

  describe '#find_brewery_by_name serialized reponse' do
    describe 'happy path-expected response' do
      it 'returns a successful response with the expected top level and attributes keys' do 
        count = 7
        name = 'Odell'
        get "/api/v1/search_breweries?name=#{name}&count=#{count}" 
        
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
      
      it 'attribute keys are the expected datatypes' do
        count = 6
        name = 'Odell'
        get "/api/v1/search_breweries?name=#{name}&count=#{count}" 
        
        breweries = JSON.parse(response.body, symbolize_names: true)
        
        
        breweries[:data].each do |brew|
          expect(brew[:attributes][:name]).to include(name)
          
          expect(brew[:attributes][:name]).to be_a(String)
          expect(brew[:attributes][:city]).to be_a(String)
          expect(brew[:attributes][:state]).to be_a(String)
          expect(brew[:attributes][:longitude]).to be_a(String)
          expect(brew[:attributes][:latitude]).to be_a(String)
          expect(brew[:attributes][:website_url]).to be_a(String) unless brew[:attributes][:website_url].nil?
        end
      end      
    end
  end
  
  describe '#find_brewery_by_id serialized reponse' do
    describe 'happy path-expected response' do
      it 'returns a successful response;expected top level and attributes keys' do 
        
        id = "angry-james-brewing-co-silverthorne"
        get "/api/v1/search_breweries/#{id}"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        brewery = JSON.parse(response.body, symbolize_names: true)

        expect(brewery).to be_a(Hash)
        expect(brewery[:data]).to have_key(:type)
        expect(brewery[:data]).to have_key(:id)
        expect(brewery[:data]).to have_key(:attributes)

        expect(brewery[:data][:id]).to eq(id)

        expect(brewery[:data][:attributes][:name]).to be_a(String)
        expect(brewery[:data][:attributes][:city]).to be_a(String)
        expect(brewery[:data][:attributes][:state]).to be_a(String)
        expect(brewery[:data][:attributes][:longitude]).to be_a(String)
        expect(brewery[:data][:attributes][:latitude]).to be_a(String)
        expect(brewery[:data][:attributes][:website_url]).to be_a(String) unless brewery[:data][:attributes][:website_url].nil?
      end
    end
  end
end