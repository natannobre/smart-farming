class NotificationsController < ApplicationController
  protect_from_forgery with: :null_session, only: :handle_orion_notification

  require_relative '../usecases/save_sensor_data'

  # Payload example:
  #   {
  #     "data": [
  #         {
  #             "id": "Room1",
  #             "temperature": {
  #                 "metadata": {},
  #                 "type": "Float",
  #                 "value": 28.5
  #             },
  #             "type": "Room"
  #         }
  #     ],
  #     "subscriptionId": "57458eb60962ef754e7c0998"
  #   }

  def handle_orion_notification
    SaveSensorData.new(request.body.read).call

    # Return a 200 OK response
    render json: { status: 'OK' }, status: :ok
  end
end
