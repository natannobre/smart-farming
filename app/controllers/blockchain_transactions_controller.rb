class BlockchainTransactionsController < ApplicationController
  before_action :set_device, only: %i[show]

  def index
    @blockchain_transactions = BlockchainTransaction.all
  end

  def new
    @blockchain_transaction = BlockchainTransaction.new
  end

  def create
    @blockchain_transaction = BlockchainTransaction.new(blockchain_transaction_params)
    @device = Device.find_by(device_id: @blockchain_transaction.device_name)

    @blockchain_transaction.device_id = @device.id if @device.present?

    respond_to do |format|
      if @device.present? && @blockchain_transaction.save
        BlockchainTransactionJob.perform_later(@blockchain_transaction)

        format.html { redirect_to device_url(@blockchain_transaction), notice: 'Blockchain Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @blockchain_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blockchain_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  private

  def set_blockchain_transaction
    @blockchain_transaction = BlockchainTransaction.find(params[:id])
  end

  def blockchain_transaction_params
    params.require(:blockchain_transaction).permit(:device_name, :value)
  end
end
