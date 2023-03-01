require 'rails_helper'

RSpec.describe Trail, type: :model do
  describe 'relationships' do
    it { should have_many(:user_trails).dependent(:destroy) }
  end
  
  describe 'validations for presence and uniqueness' do
    it { should validate_presence_of :trail_id }
    it { should validate_uniqueness_of(:trail_id) }
  end
end