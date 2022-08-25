class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :movable

  validates :start_at, uniqueness: true

  scope :up_comings, ->(nb_days) {
                       where('start_at >= ? AND start_at < ?',
                             Time.zone.now,
                             Time.zone.now + nb_days.days).order(start_at: :asc)
                     }

  def self.next
    next_booking = Time.zone.now.to_date
    next_booking += 1.day while find_by(start_at: next_booking)
    next_booking
  end

end
