module ApplicationHelper
  def date_to_timestamp(date)
    date.to_time.to_i
  end

  def timestamp_to_date(timestamp)
    Time.at(timestamp).to_datetime
  end
end
