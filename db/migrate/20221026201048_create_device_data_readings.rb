class CreateDeviceDataReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :device_data_readings do |t|
      t.integer :device_id
      t.string :device_name
      t.string :value

      t.timestamps
    end
  end
end
