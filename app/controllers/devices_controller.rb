class DevicesController < ApplicationController
  before_action :set_device, only: %i[show edit update destroy subscribe_notification_to_device unsubscribe_notification_to_device]

  # GET /devices or /devices.json
  def index
    @devices = Device.all
  end

  # GET /devices/1 or /devices/1.json
  def show; end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit; end

  # POST /devices or /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        Fiware::IotAgent.create_device(device_id: device_params[:device_id], object_id: device_params[:object_id],
                                       name: device_params[:name])

        format.html { redirect_to device_url(@device), notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1 or /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to device_url(@device), notice: 'Device was successfully updated.' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1 or /devices/1.json
  def destroy
    Fiware::IotAgent.destroy_device(device_id: @device.device_id)

    @device.device_data_readings.destroy_all
    @device.destroy

    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def subscribe_notification_to_device
    response = Fiware::Orion.subscribe_device_to_receive_notifications(@device)
    @device.update(subscription_id: response.headers['location'].split('/')[3]) if response.created?
    redirect_to device_url(@device)
  end

  def unsubscribe_notification_to_device
    response = Fiware::Orion.unsubscribe_device_to_receive_notifications(@device)
    @device.update(subscription_id: nil) unless response['error'].present?
    redirect_to device_url(@device)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_device
    @device = Device.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def device_params
    params.require(:device).permit(:device_id, :name, :object_id, :place)
  end
end
