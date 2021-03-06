class Api::V1::BeersController < Api::V1::ApiController
  expose(:beer)

  def index
    if params[:beer]
      render json: Beer.where(beer_params)
    else
      render json: Beer.all
    end
  end

  def show
    render json: beer
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
      :brewery_id,
      :style_id
    )
  end
end
