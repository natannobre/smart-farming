class BlockchainTransactionsPresenter
  def self.state_color_class(state)
    case state
    when 'Valid'
      'text-success'
    when 'Invalid'
      'text-danger'
    else
      'text-warning'
    end
  end
end
