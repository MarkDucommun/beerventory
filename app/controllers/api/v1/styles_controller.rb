class Api::V1::StylesController < Api::V1::ApiController
  def create
    render json: Style.create(style_params)
  end

  private

  def style_params
    params.require(:style).permit(:name)
  end
end
