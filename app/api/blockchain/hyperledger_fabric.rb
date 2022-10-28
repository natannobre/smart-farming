module Blockchain
  class HyperledgerFabric
    @base_url = 'http://host.docker.internal:4000'

    def self.create_user(username = 'natannobre1')
      path = '/users'

      body = {
        "username": username,
        "orgName": 'Org1'
      }

      HTTParty.post("#{@base_url}#{path}",
                    headers: { 'Content-Type' => 'application/json',
                               'Authorization' => "Bearer #{ENV['BLOCKCHAIN_API_KEY']}" },
                    body: body.to_json)
    end

    def self.create_device_reading(reading:, timestamp: 1_600_134_444_309_939, device_id: 'temp001')
      path = '/channels/mychannel/chaincodes/fabcar'

      args = [
        {
          "id": device_id,
          "make": reading,
          "addedAt": timestamp,
          "model": '',
          "color": '',
          "owner": ''
        }.to_json
      ]

      body = {
        "fcn": 'CreateCar',
        "chaincodeName": 'fabcar',
        "channelName": 'mychannel',
        "args": args
      }

      HTTParty.post("#{@base_url}#{path}",
                    headers: { 'Content-Type' => 'application/json',
                               'Authorization' => "Bearer #{ENV['BLOCKCHAIN_API_KEY']}" },
                    body: body.to_json)
    end

    def self.fetch_by_device_id(device_id = 'temp001')
      path = "/channels/mychannel/chaincodes/fabcar?fcn=GetCarById&args=[\"#{device_id}\"]"

      HTTParty.get("#{@base_url}#{path}",
                   headers: { Authorization: "Bearer #{ENV['BLOCKCHAIN_API_KEY']}" })
    end
  end
end
