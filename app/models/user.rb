class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence:true
  validates :email, presence: true, uniqueness: true
  has_many :movables, dependent: :destroy # from the provider perspective
  has_many :bookings # from the renter perspective
  has_attachment :photo
end
