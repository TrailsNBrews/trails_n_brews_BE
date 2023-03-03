require 'rails_helper'

describe 'User trails' do
  it 'create' do
    user = create(:user)
    trail = create(:trail)

    params = { user_id: [user.id.to_s], trail_id: trail.trail_id, trail_name: trail.name }

    uri          = "/api/v1/user_trails"
    trail_params = { user_id: params[:user_id], trail_id: params[:trail_id], trail_name: params[:trail_name] }
    
    post uri, params: trail_params
    
    expect(response).to be_successful

    expect(UserTrail.find_by(user_id: user.id,trail_id: trail.id)).to be_a(UserTrail)
  end

  it 'delete' do
    user = create(:user)
    trail = create(:trail)
    
    user_trail = UserTrail.create(user_id: user.id, trail_id: trail.id)
    expect(UserTrail.all).to eq([user_trail])
    delete api_v1_user_trail_path(user_trail.id)

    expect(response).to be_successful
    expect(UserTrail.all).to eq([])
  end
end