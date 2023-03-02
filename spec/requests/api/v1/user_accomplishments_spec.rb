require 'rails_helper'

describe 'User Accomplishments' do
  it 'can display user accomplishments' do
    user = create(:user)
    brewery = create(:brewery)
    trail = create(:trail)
    user.breweries << brewery
    user.trails << trail
    get api_v1_user_accomplishment_path(user.id)

    expect(response).to be_successful

    accomplishments = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    expect(accomplishments[:data][:user]).to be_a(Hash)
    expect(accomplishments[:data][:user][:user_id]).to eq(user.id)
    expect(accomplishments[:data][:user][:user_first_name]).to eq(user.first_name)
    expect(accomplishments[:data][:user][:user_last_name]).to eq(user.last_name)
    expect(accomplishments[:data][:user][:breweries]).to be_a(Array)
    expect(accomplishments[:data][:user][:breweries][0][:brewery_id]).to eq(brewery.brew_id)
    expect(accomplishments[:data][:user][:breweries][0][:name]).to eq(brewery.name)
    expect(accomplishments[:data][:user][:trails][0][:trail_id]).to eq(trail.trail_id)
    expect(accomplishments[:data][:user][:trails][0][:name]).to eq(trail.name)
  end
end