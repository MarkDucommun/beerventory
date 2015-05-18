class Api::V1::BreweriesController < Api::V1::ApiController
  expose(:brewery)

  def create
    render json: Brewery.create(brewery_params)
  end

  def update
    brewery.update_attributes(brewery_params)
    render json: brewery
  end

  private

  def brewery_params
    params.require(:brewery).permit(
      :name,
      :city,
      :state
    )
  end
end
