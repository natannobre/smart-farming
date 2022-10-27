class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @devices = Device.all
    @device_data_presenter = FormatDeviceDataPresenter.new(@devices)

    @cards = @device_data_presenter.cards
    @chart_area_arr = @device_data_presenter.chart_area_arr
    @data_pie_chart = @device_data_presenter.chart_pie

    @earnings = {
      deposits: 290.29
    }
  end
end
