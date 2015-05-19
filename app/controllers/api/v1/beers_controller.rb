class Api::V1::BeersController < Api::V1::ApiController
  expose(:beer)

  def index
    render json: Beer.all
  end

  def create
    render json: Beer.create(beer_params)
  end

  def update
    beer.update_attributes(beer_params)
    render json: beer
  end

  def destroy
    render json: beer.destroy
  end

  private

  def beer_params
    params.require(:beer).permit(
      :name,
      :brewery_id
    )
  end
end
