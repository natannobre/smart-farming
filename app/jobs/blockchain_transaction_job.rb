class BlockchainTransactionJob < ApplicationJob
  queue_as :default

  include BlockchainTransactionConcern

  def perform(transaction)
    Rails.logger.info "Performing BlockchainTransactionJob for #{transaction.inspect}"
    timestamp = date_to_timestamp(transaction.created_at)
    Blockchain::HyperledgerFabric.create_device_reading(timestamp: timestamp,
                                                        device_id: transaction.device_id,
                                                        device_name: transaction.device_name,
                                                        reading: transaction.value)
  end
end
