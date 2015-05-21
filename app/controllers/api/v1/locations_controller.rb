class Api::V1::LocationsController < Api::V1::ApiController
  expose(:location)

  def index
    render json: Location.all
  end

  def create
    render json: Location.create(location_params)
  end

  def update
    location.update_attributes(location_params)
    render json: location
  end

  private

  def location_params
    params.require(:location).permit(
      :container,
      :room
    )
  end
end
