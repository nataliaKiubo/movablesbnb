class Movable < ApplicationRecord
  belongs_to :user
  validates :name, :description, :min_rent_time, :max_rent_time, :main_image, :stock, :price, :categories, presence: true
  validates :name, length: { in: 6..250 }, uniqueness: true
  validates :categories, inclusion: { in: %w(Armchairs Sofas Chairs Tables Lights Rugs Beds) }
end
