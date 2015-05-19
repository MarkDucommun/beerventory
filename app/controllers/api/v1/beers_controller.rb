class Api::V1::BeersController < Api::V1::ApiController
  def create
    render json: Beer.create(beer_params)
  end

  private

  def beer_params
    params.require(:beer).permit(
      :name,
      :brewery_id
    )
  end
end
