class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :checkin_on
      t.date :checkout_on
      t.references :user, null: false, foreign_key: true
      t.references :movable, null: false, foreign_key: true

      t.timestamps
    end
  end
end
