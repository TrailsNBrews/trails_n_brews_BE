class User < ApplicationRecord
  has_many :user_breweries, dependent: :destroy
  validates_presence_of :google_id, :google_token, :first_name, :last_name, :email
  validates_uniqueness_of :google_id, :email

end