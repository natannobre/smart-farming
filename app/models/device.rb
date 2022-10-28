class Device < ApplicationRecord
  has_many :device_data_readings

  def self.entity_name(device)
    "urn:ngsd-ld:#{device.device_id}"
  end

  def self.format_mqtt_topic(device)
    "/ul/#{ENV['FIWARE_API_KEY']}/#{device.device_id}/attrs"
  end

  def readings
    device_data_readings.order(created_at: :desc)
  end
end
