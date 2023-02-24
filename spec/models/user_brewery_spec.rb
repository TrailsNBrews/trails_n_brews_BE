require 'rails_helper'

RSpec.describe UserBrewery, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:brewery) }
  end
end