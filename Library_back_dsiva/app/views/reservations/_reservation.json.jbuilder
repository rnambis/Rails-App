json.extract! reservation, :id, :size, :library, :date, :time, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)