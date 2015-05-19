class Api::V1::ContainersController < Api::V1::ApiController
  def create
    render json: Container.create(container_params)
  end

  private

  def container_params
    params.require(:container).permit(
      :type,
      :volume,
      :volume_unit,
      :name
    )
  end
end
