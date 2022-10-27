class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @devices = Device.all
    @device_data_presenter = FormatDeviceDataPresenter.new(@devices)

    @cards = @device_data_presenter.cards
    @chart_area_arr = @device_data_presenter.chart_area_arr
    @dataPieChart = @device_data_presenter.chart_pie

    # @dataPieChart = {
    #   type: 'doughnut',
    #   labels: %w[Direct Referral Social],
    #   labelsColor: %w[#4e73df #1cc88a #36b9cc],
    #   datasets: {
    #     data: [32, 36, 32]
    #   }
    # }.to_json

    @allTasks = {
      title: 'Server Migration',
      progress: 20,
      isFinished: false,
      color: 'bg-danger'
    },
                {
                  title: 'Sales Tracking',
                  progress: 40,
                  isFinished: false,
                  color: 'bg-warning'
                },
                {
                  title: 'Customer Database',
                  progress: 60,
                  isFinished: false,
                  color: 'bg-info'
                },
                {
                  title: 'Payout Details',
                  progress: 40,
                  isFinished: false,
                  color: 'bg-primary'
                },
                {
                  title: 'Account Setup',
                  progress: 100,
                  isFinished: true,
                  color: 'bg-success'
                }

    @earnings = {
      deposits: 290.29
    }
  end
end
