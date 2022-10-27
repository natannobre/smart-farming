class SaveSensorData
  def initialize(payload)
    @payload = payload
  end

  def call
    # Parse the request body
    body = JSON.parse(@payload)

    # Get the device id
    device_id = body['data'][0]['id'].split(':')[2]

    # Get the device
    device = Device.find_by(device_id: device_id)

    # Get the data
    data = body['data'][0][device.name.to_s]['value']

    # Save the data point
    device.device_data_readings.create(device_name: device.device_id, value: data)
  end
end
