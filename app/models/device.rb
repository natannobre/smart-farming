class Device < ApplicationRecord
  def self.entity_name(device)
    "urn:ngsd-ld:#{device.device_id}"
  end

  def self.format_mqtt_topic(device)
    "/ul/#{ENV['API_KEY']}/#{device.device_id}/attrs"
  end
end
