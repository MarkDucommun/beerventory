class Api::V1::BreweriesController < Api::V1::ApiController
  expose(:brewery)

  def index
    render json: Brewery.all
  end

  def show
    render json: brewery
  end

  def create
    render json: Brewery.create(brewery_params)
  end

  def update
    brewery.update_attributes(brewery_params)
    render json: brewery
  end

  def destroy
    render json: brewery.destroy
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
