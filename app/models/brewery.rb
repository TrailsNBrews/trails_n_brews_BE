class Brewery < ApplicationRecord
  validates_presence_of :brew_id
  validates_uniqueness_of :brew_id
end
