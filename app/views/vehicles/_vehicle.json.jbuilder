json.extract! vehicle, :id, :vehicle_type, :model, :color, :serial_number, :purchase_price, :purchase_date, :owner_id, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
