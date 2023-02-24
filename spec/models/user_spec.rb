require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations for presence and uniquness' do
    it { should validate_presence_of :google_id }
    it { should validate_presence_of :google_token }
    it { should validate_presence_of :email }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_uniqueness_of(:google_id) }
    it { should validate_uniqueness_of(:email) }
  end
end
