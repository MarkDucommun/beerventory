class Api::V1::BreweriesController < Api::V1::ApiController
  def create
    Brewery.create(brewery_params)
    render nothing: true
  end

  private

  def brewery_params
    params.require(:brewery).permit(
      :name
    )
  end
end
