json.extract! room, :id, :room_id, :size, :library, :status, :created_at, :updated_at
json.url room_url(room, format: :json)