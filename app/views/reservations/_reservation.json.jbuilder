json.extract! reservation, :id, :room_id, :student_id, :giorno, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
