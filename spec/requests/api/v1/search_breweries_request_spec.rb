require 'rails_helper'

describe 'Search Breweries API' do

  describe '#find_by_location serialized reponse' do
    it 'render a JSON representation of all records of the requested resource' do
      create_list(:brewery, 15)
      count = 5
      location = "39.7392,-104.9903" 
      get "/api/v1/search_breweries?loc=#{location}&count=#{count}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      breweries = JSON.parse(response.body, symbolize_names: true)
      expect(breweries[:data].count).to be <=(5)
      
      require 'pry';binding.pry
      breweries.each do 
      


    end

  end

end