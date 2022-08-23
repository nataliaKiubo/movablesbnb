json.extract! movable, :id, :name, :description, :min_rent_time, :max_rent_time, :main_image, :gallery_image, :stock, :price, :user_id, :categories, :created_at, :updated_at
json.url movable_url(movable, format: :json)
