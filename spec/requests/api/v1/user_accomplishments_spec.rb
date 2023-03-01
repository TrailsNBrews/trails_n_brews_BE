require 'rails_helper'

describe 'User Accomplishments' do
  it 'can display user accomplishments' do
    user = create(:user)
    brewery = create(:brewery)
    trail = create(:trail)
    user.breweries << brewery
    user.trails << trail
    get api_v1_user_accomplishment_path(user.id)

    expect(response).to be(successful)
  end
end