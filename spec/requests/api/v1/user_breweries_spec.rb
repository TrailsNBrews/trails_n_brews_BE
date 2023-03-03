require 'rails_helper'

describe 'User Breweries' do
  it 'create' do
    user = create(:user)
    brewery = create(:brewery)

    params = { user_id: [user.id.to_s], brew_id: brewery.brew_id, brew_name: brewery.name }

    uri            = "/api/v1/user_breweries"
    brewery_params = { user_id: params[:user_id], brew_id: params[:brew_id], brew_name: params[:brew_name] }
    
    post uri, params: brewery_params
    
    expect(response).to be_successful
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
