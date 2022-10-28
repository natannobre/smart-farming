module Blockchain
  class HyperledgerFabric
    @base_url = 'http://host.docker.internal:4000'

    def self.fetch_by_device_id(device_id: 'temp001')
      path = "/channels/mychannel/chaincodes/fabcar?fcn=GetCarById&args=[\"#{device_id}\"]"

      HTTParty.get("#{@base_url}#{path}",
                   headers: { Authorization: "Bearer #{ENV['BLOCKCHAIN_API_KEY']}" })
    end
  end
end
