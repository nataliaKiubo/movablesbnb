class Movable < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_attachment :photo
end
