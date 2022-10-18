class SensorController < ApplicationController
  protect_from_forgery with: :null_session, only: :handle_orion_notification

  def handle_orion_notification
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
    # }

    Rails.logger.info " === Received notification from Orion: #{params} ==="

    # # Parse the request body
    # body = JSON.parse(request.body.read)

    # # Get the device id
    # device_id = body['data'][0]['id']

    # # Get the device
    # device = Device.find_by(device_id: device_id)

    # # Get the data
    # data = body['data'][0]['temperature']['value']

    # # Save the data point
    # data_point.save

    # Return a 200 OK response
    render json: { status: 'OK' }, status: :ok
  end
end
