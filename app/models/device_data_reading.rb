class DeviceDataReading < ApplicationRecord
  def self.to_csv
    headers = %w[device_name value timestamp]
    attributes = %w[device_name value created_at]
    readings = DeviceDataReading.all

    CSV.generate(headers: true) do |csv|
      csv << headers

      readings.each do |data|
        csv << attributes.map { |attr| data.send(attr) }
      end
    end
  end
end
