class Api::V1::BreweriesController < Api::V1::ApiController
  def create
    render json: Brewery.create(brewery_params)
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
