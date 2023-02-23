require 'rails_helper'


RSpec.describe 'Search Index' do
  
  
  it 'returns five results' do
    location = "39.7392,-104.9903"
    count = 5
    data = OpenBrewService.find_by_location(location,count)
    expect(data).to be_a(Array)
    expect(data.count).to eq(count)
    expect(data[0]).to be_a(Hash)
    expect(data[0]).to have_key(:id)
    expect(data[0]).to have_key(:name)
    expect(data[0]).to have_key(:city)
    expect(data[0][:name]).to be_a(String)
    # require 'pry';binding.pry

  end

end