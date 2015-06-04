class Api::V1::ContainersController < Api::V1::ApiController
  expose(:container)

  def index
    render json: Container.all
  end

  def show
    render json: container
  end

  def create
    render json: Container.create(container_params)
  end

  def update
    container.update_attributes(container_params)
    render json: container
  end

  def destroy
    render json: container.destroy
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
