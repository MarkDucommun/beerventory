class Api::V1::UnitsController < Api::V1::ApiController
  expose(:unit)

  def index
    render json: Unit.all
  end

  def create
    render json: Unit.create(unit_params)
  end

  def update
    unit.update_attributes(unit_params)
    render json: unit
  end

  def destroy
    render json: unit.destroy
  end

  private

  def unit_params
    params.require(:unit).permit(
      :bottling_date,
      :purchase_date,
      :best_by_date,
      :beer_id,
      :container_id
    )
  end
end
