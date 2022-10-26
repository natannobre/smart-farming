class AddSubscriptionIdToDevices < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :subscription_id, :string
  end
end
