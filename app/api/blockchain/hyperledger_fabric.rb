module Blockchain
  class HyperledgerFabric
    @base_url = 'http://host.docker.internal:4000'

    def self.fetch_by_device_id(device_id: 'temp001')
      path = "/channels/mychannel/chaincodes/fabcar?fcn=GetCarById&args=[#{device_id}]"

      HTTParty.get("#{@base_url}#{path}",
                   headers: { 'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NjY5NjI0OTMsInVzZXJuYW1lIjoibmF0YW5ub2JyZTEiLCJvcmdOYW1lIjoiT3JnMSIsImlhdCI6MTY2NjkyNjQ5M30.mVVzoYsrQaQTwuuF6sRzbznrWJkLbWpnt0efJe0t4cY' })
    end
  end
end
