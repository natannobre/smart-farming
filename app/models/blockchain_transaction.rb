class BlockchainTransaction < ApplicationRecord
  include BlockchainTransactionConcern

  def state
    timestamp = date_to_timestamp(created_at)
    response = Blockchain::HyperledgerFabric.fetch_by_device_id(timestamp)

    if response['result']['id'].present?
      if response['result']['owner'] == value
        'Valid'
      else
        'Invalid'
      end
    else
      'Invalid'
    end
  end
end
