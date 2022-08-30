class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @data_chart = {
      type: 'line',
      labels: %w[Jan Feb Mar Apr May Jun Jul Aug Sep],
      datasets: {
        label: 'Earnings',
        data: [2235, 2234, 5343, 8789, 9234, 4325, 5490, 2899, 7843]
      }
    }.to_json

    @dataPieChart = {
      type: 'doughnut',
      labels: %w[Direct Referral Social],
      labelsColor: %w[#4e73df #1cc88a #36b9cc],
      datasets: {
        data: [32, 36, 32]
      }
    }.to_json
    
    @allTasks = {
      title:      'Server Migration',
      progress:    20,
      isFinished:  false,
      color:      'bg-danger',
    },
    {
      title:      'Sales Tracking',
      progress:    40,
      isFinished:  false,
      color:      'bg-warning',
    },
    {
      title:      'Customer Database',
      progress:    60,
      isFinished:  false,
      color:      'bg-info',
    },
    {
      title:      'Payout Details',
      progress:    40,
      isFinished:  false,
      color:      'bg-primary',
    },
    {
      title:      'Account Setup',
      progress:    100,
      isFinished:  true,
      color:      'bg-success',
    }

    @earnings = {
      deposits: 290.29,
    }

    @cards = {
      title: 'Resíduos',
      value: '$4.564.000',
      color: 'info',
      icon:  'fa-dollar-sign',
    },
    {
      title: 'População',
      value:  87728,
      color: 'primary',
      icon:  'fa-comments',
    },
    {
      title: 'Potêncial econômico',
      value: '$2.858.000',
      color: 'success',
      icon:  'fa-dollar-sign',
    },
    {
      title: 'Custos com RSU',
      value: '$2.070.000',
      color: 'warning',
      icon:  'fa-dollar-sign',
    }
  end
end