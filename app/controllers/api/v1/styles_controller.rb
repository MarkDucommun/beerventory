class Api::V1::StylesController < Api::V1::ApiController
  expose(:style)

  def index
    render json: Style.all
  end

  def show
    render json: style
  end

  def create
    render json: Style.create(style_params)
  end

  def update
    style.update_attributes(style_params)
    render json: style
  end

  def destroy
    render json: style.destroy
  end

  private

  def style_params
    params.require(:style).permit(:name)
  end
end
