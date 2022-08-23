class CreateMovables < ActiveRecord::Migration[7.0]
  def change
    create_table :movables do |t|
      t.string :name
      t.text :description
      t.decimal :min_rent_time
      t.decimal :max_rent_time
      t.string :main_image
      t.string :gallery_image
      t.integer :stock
      t.decimal :price
      t.references :user, null: false, foreign_key: true
      t.string :categories

      t.timestamps
    end
  end
end
