class Brewery < ApplicationRecord
  has_many :user_breweries, dependent: :destroy
  validates_presence_of :brew_id
  validates_uniqueness_of :brew_id
end
