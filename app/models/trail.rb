class Trail < ApplicationRecord
  has_many :user_trails, dependent: :destroy
  validates_presence_of :trail_id
  validates_uniqueness_of :trail_id
end