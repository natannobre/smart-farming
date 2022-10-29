class CreateBlockchainTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :blockchain_transactions do |t|
      t.integer :device_id
      t.string :device_name
      t.string :value

      t.timestamps
    end
  end
end
