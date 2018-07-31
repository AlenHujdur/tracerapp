class CamerasController < ApplicationController

  def new
    @camera = Camera.new
  end

  def create
    @camera = Camera.new(camera_params)
    @location = Location.new(location_params)
    @camera.location.save!
    @location.user = current_user
    if @location.save
      flash[:notice] = "Location saved!"
      respond_to do |format|    
      format.html { redirect_to location_path(@location), notice: 'Location was successfully created.' }
      end
    else
       render 'new'
    end
    
  end
  private
  def camera_params
    params.require(:camera).permit(:image, :map_image)
  end

  def location_params
    params.require(:location).permit(:latitude, :longitude, :info, :image, :map_image, :user_id)
  end

  def require_same_user
    if current_user != @location.user
      flash[:danger] = "You can only edit your own recipes"
      redirect_to locations_path
    end
  end

end
