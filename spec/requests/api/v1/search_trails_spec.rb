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
        expect(trail[:attributes][:name]).to be_a(String)
        expect(trail[:attributes]).to have_key(:coordinates)
        expect(trail[:attributes][:coordinates]).to be_a(String)
        expect(trail[:attributes]).to have_key(:bathrooms)
        expect(trail[:attributes][:bathrooms]).to be_a(String)
      end
    end

    it 'returns a successful response with empty json if no matches' do
      get '/api/v1/search_trails?search=jklfjakld'

      expect(response).to be_successful

      trails = JSON.parse(response.body, symbolize_names: true)

      expect(trails).to be_a(Hash)
      expect(trails[:data]).to be_a(Array)
      expect(trails[:data].count).to eq(1)
      expect(trails[:data].first.empty?).to eq(true)
      expect(trails[:data].first).to_not have_key(:id)
    end
  end

  describe '#find_by_id' do
    it 'returns a successful response with the expected top level and attributes keys' do
      get '/api/v1/search_trails/62934'

      expect(response).to be_successful

      trails = JSON.parse(response.body, symbolize_names: true)
      
      expect(trails).to be_a(Hash)
      expect(trails[:data]).to be_a(Hash)
      expect(trails[:data][:trail]).to be_a(Hash)
      
      expect(trails[:data][:trail]).to have_key(:type)
      expect(trails[:data][:trail]).to have_key(:id)
      expect(trails[:data][:trail]).to have_key(:attributes)
      expect(trails[:data][:trail][:attributes]).to have_key(:name)
      expect(trails[:data][:trail][:attributes][:name]).to be_a(String)
      expect(trails[:data][:trail][:attributes]).to have_key(:coordinates)
      expect(trails[:data][:trail][:attributes][:coordinates]).to be_a(String)
      expect(trails[:data][:trail][:attributes]).to have_key(:bathrooms)
      expect(trails[:data][:trail][:attributes][:bathrooms]).to be_a(String)

      expect(trails[:data][:breweries]).to be_a(Array)
      
      trails[:data][:breweries].each do |brewery|
        expect(brewery).to have_key(:type)
        expect(brewery).to have_key(:id)
        expect(brewery).to have_key(:attributes)
        expect(brewery[:attributes]).to have_key(:name)
        expect(brewery[:attributes]).to have_key(:city)
        expect(brewery[:attributes]).to have_key(:state)
        expect(brewery[:attributes]).to have_key(:postal_code)
        expect(brewery[:attributes]).to have_key(:longitude)
        expect(brewery[:attributes]).to have_key(:latitude)
        expect(brewery[:attributes]).to have_key(:website_url)
      end
    end

    it 'returns an unsuccessful response with error json if no matches' do
      get '/api/v1/search_trails/5428'

      expect(response).to_not be_successful

      trails = JSON.parse(response.body, symbolize_names: true)

      expect(trails).to be_a(Hash)
      expect(trails[:errors]).to be_a(String)
      expect(trails[:errors]).to eq("Unable to locate trail")
      expect(trails).to_not have_key(:id)
    end
  end
end
