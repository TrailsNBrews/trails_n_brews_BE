require 'rails_helper'

describe 'User Breweries' do
  it 'create' do
    user = create(:user)
    brewery = create(:brewery)

    post "/api/v1/user_breweries?user=#{user.id}&brewery=#{brewery.id}"

    expect(response).to be_successful

    expect(UserBrewery.find_by(user_id: user.id,brewery_id: brewery.id)).to be_a(UserBrewery)
  end

  it 'delete' do
    user = create(:user)
    brewery = create(:brewery)
    user_brewery = UserBrewery.create(user_id: user.id, brewery_id: brewery.id)
    
    expect(UserBrewery.all).to eq([user_brewery])
    delete api_v1_user_brewery_path(user_brewery.id, user.id)
    
    expect(response).to be_successful
    expect(UserBrewery.all).to eq([])
  end
end
