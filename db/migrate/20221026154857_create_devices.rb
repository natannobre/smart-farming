class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :device_id
      t.string :name
      t.string :object_id
      t.string :place
      t.string :type

      t.timestamps
    end
  end
end
