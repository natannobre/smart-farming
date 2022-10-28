# frozen_string_literal: true

module Fiware
  class IotAgent
    @base_url = 'http://iot-agent:4041'

    def self.create_service_group(api_key: ENV['FIWARE_API_KEY'], cbroker: 'http://orion:1026', entity_type: 'Thing', resource: '')
      path = '/iot/services'

      body = {
        "services": [
          {
            "apikey": api_key,
            "cbroker": cbroker,
            "entity_type": entity_type,
            "resource": resource
          }
        ]
      }

      HTTParty.post("#{@base_url}#{path}",
                    headers: { 'Content-Type' => 'application/json',
                               'fiware-service' => 'openiot',
                               'fiware-servicepath' => '/' },
                    body: body.to_json)
    end

    def self.create_device(device_id: 'motion001', object_id: 'c', name: 'motion')
      path = '/iot/devices'

      body = {
        "devices": [
          {
            "device_id": device_id,
            "entity_name": "urn:ngsd-ld:#{device_id}",
            "entity_type": name,
            "protocol": 'PDI-IoTA-UltraLight',
            "transport": 'MQTT',
            "timezone": 'America/Fortaleza',
            "attributes": [
              {
                "object_id": object_id,
                "name": name,
                "type": 'Integer'
              }
            ],
            "static_attributes": [
              {
                "name": 'SmartFarmingDevice',
                "type": name,
                "value": 'urn:ngsi-ld:FarmingDevice'
              }
            ]
          }
        ]
      }

      HTTParty.post("#{@base_url}#{path}",
                    headers: { 'Content-Type' => 'application/json',
                               'fiware-service' => 'openiot',
                               'fiware-servicepath' => '/' },
                    body: body.to_json)
    end

    def self.destroy_device(device_id: 'motion001')
      path = '/iot/devices'

      HTTParty.delete("#{@base_url}#{path}/#{device_id}",
                      headers: { 'Content-Type' => 'application/json',
                                 'fiware-service' => 'openiot',
                                 'fiware-servicepath' => '/' })
    end
  end
end
