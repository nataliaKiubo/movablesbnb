class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :movable
  has_many :users, through: :movables
end
