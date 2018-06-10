class CamerasController < ApplicationController

  def new
    @camera = Camera.new
  end

  private

  def camera_params
    params.require(:camera).permit(:image, :map_image)
  end

end
