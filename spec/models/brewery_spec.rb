require 'rails_helper'

RSpec.describe Brewery, type: :model do
  describe 'validations for presence and uniquness' do
    it { should validate_presence_of :brew_id }
    it { should validate_uniqueness_of(:brew_id) }
  end
end
