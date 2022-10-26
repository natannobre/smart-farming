class FormatDeviceDataPresenter
  def initialize(devices)
    @devices = devices
    @colors = %w[primary secondary success danger warning info dark body]
  end

  def cards
    return [] if @devices.empty?

    @devices.map do |device|
      {
        title: "#{device.name} - #{device.device_id}",
        value: device.readings.present? ? device.readings.first.value : 'No value received',
        color: @colors.sample
      }
    end
  end

  def chart_area
    return {} if @devices.empty?

    device = @devices.first
    data_readings = device.readings.reverse
    {
      type: 'line',
      labels: data_readings.map(&:created_at),
      datasets: {
        label: 'Value',
        data: data_readings.map(&:value)
      }
    }.to_json
  end
end
