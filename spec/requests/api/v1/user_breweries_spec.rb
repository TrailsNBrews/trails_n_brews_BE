require 'rails_helper'

describe 'User Breweries' do
  it 'create' do
    user = create(:user)
    brewery = create(:brewery)

    post "/api/v1/user_breweries?user=#{user.id}&brewery=#{brewery.id}"

    expect(response).to be_successful

    expect(UserBrewery.find_by(user_id: user.id,brewery_id: brewery.id)).to be_a(UserBrewery)
  end
end
