json.extract! reservation, :id, :room_name, :name, :size, :library, :booked_at, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)