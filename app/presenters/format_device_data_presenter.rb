class FormatDeviceDataPresenter
  def initialize(devices)
    @devices = devices
    @colors = %w[primary secondary success danger warning info dark body]
    @hex_colors = %w[#0d6efd #6610f2 #6f42c1 #dc3545 #fd7e14 #ffc107 #198754 #20c997 #0dcaf0 #adb5bd #000]
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

  def chart_area(device:)
    return {} if @devices.empty?

    data_readings = device.readings.reverse
    {
      device_id: device.device_id,
      type: 'line',
      labels: data_readings.map(&:created_at),
      datasets: {
        label: 'Value',
        data: data_readings.map(&:value)
      }
    }.to_json
  end

  def chart_area_arr
    @devices.map do |device|
      chart_area(device: device)
    end
  end

  def chart_pie
    return {} if @devices.empty?

    labels_arr = @devices.map do |device|
      [device.device_id]
    end
    data_arr = @devices.map do |device|
      [device.readings.present? ? device.readings.count : 0]
    end

    {
      type: 'doughnut',
      labels: labels_arr,
      labelsColor: @hex_colors.sample(@devices.count),
      datasets: {
        data: data_arr
      }
    }.to_json
  end
end
