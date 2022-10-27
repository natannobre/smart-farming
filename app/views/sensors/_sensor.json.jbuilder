json.extract! sensor, :id, :device_id, :name, :object_id, :place, :type, :created_at, :updated_at
json.url device_url(sensor, format: :json)
