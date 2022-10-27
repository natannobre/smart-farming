class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @devices = Device.all
    @device_data_presenter = FormatDeviceDataPresenter.new(@devices)

    @cards = @device_data_presenter.cards
    @chart_area_arr = @device_data_presenter.chart_area_arr
    @dataPieChart = @device_data_presenter.chart_pie
  end
end
