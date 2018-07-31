class CamerasController < ApplicationController

  def new
    @camera = Camera.new
  end

  def create
    @camera = Camera.new(camera_params)
    @camera.save!
  end
  private
  def camera_params
    params.require(:camera).permit(:image, :map_image)
  end

  def require_same_user
    if current_user != @location.user
      flash[:danger] = "You can only edit your own recipes"
      redirect_to locations_path
    end
  end

end
