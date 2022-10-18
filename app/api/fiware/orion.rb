# frozen_string_literal: true

module Fiware
  class Orion
    @base_url = 'http://orion:1026'

    def self.fetch_all_devices
      path = '/v2/entities'

      HTTParty.get("#{@base_url}#{path}", headers: { 'fiware-service' => 'openiot', 'fiware-servicepath' => '/' })
    end

    def self.fetch_device(entity_name = 'urn:ngsd-ld:motion:001')
      path = "/v2/entities/#{entity_name}"

      HTTParty.get("#{@base_url}#{path}", headers: { 'fiware-service' => 'openiot', 'fiware-servicepath' => '/' })
    end

    def self.fetch_device_attributes(entity_name = 'urn:ngsd-ld:motion:001')
      path = "/v2/entities/#{entity_name}/attrs"

      HTTParty.get("#{@base_url}#{path}", headers: { 'fiware-service' => 'openiot', 'fiware-servicepath' => '/' })
    end

    def self.format_mqtt_topic(entity_name = 'urn:ngsd-ld:motion:001')
      response = fetch_device(entity_name)
      return nil if response.body.nil? || response.body.empty?

      device_id = response['id'].split(':')[2]
      return nil if device_id.nil?

      "/ul/#{ENV['API_KEY']}/#{device_id}/attrs"
    end
  end
end
