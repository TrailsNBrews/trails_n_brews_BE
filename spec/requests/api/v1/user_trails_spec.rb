require 'rails_helper'

describe 'User trails' do
  it 'create' do
    user = create(:user)
    trail = create(:trail)

    post "/api/v1/user_trails?user=#{user.id}&trail=#{trail.id}"

    expect(response).to be_successful

    expect(UserTrail.find_by(user_id: user.id,trail_id: trail.id)).to be_a(UserTrail)
  end
end