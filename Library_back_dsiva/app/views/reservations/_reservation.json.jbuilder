json.extract! reservation, :id, :date, :time, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)