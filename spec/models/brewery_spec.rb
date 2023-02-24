require 'rails_helper'

RSpec.describe Brewery, type: :model do
  describe 'relationships' do
    it { should have_many(:user_breweries).dependent(:destroy) }
  end
  
  describe 'validations for presence and uniqueness' do
    it { should validate_presence_of :brew_id }
    it { should validate_uniqueness_of(:brew_id) }
  end
end
