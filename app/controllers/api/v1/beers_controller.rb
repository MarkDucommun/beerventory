class Api::V1::BeersController < ApplicationController
  def create
    render json: Beer.create(beer_params)
  end

  private

  def beer_params
    params.require(:beer).permit(
      :name,
      :bottling_date,
      :purchase_date,
      :best_by_date
    )
  end
end
