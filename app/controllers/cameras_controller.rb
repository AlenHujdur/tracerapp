class CamerasController < ApplicationController

  def new
    @camera = Camera.new
    #location_id = params[:id]
    #@location = Location.find(params[:id])
  end

  def create
    #@camera = Camera.new
    @camera = Camera.create(camera_params)
    if @camera.save
      flash[:notice] = "Picture saved!"
      #respond_to do |format|    
      #format.html { redirect_to location_path(@location), notice: 'Location was successfully created.' }
      #end
      redirect_to location_path(@location)
    else
       render 'new'
    end
    
  end
  private
  def camera_params
    params.require(:camera).permit(:image,:map_image)
  end

  def require_same_user
    if current_user != @location.user
      flash[:danger] = "You must be logged in!"
      redirect_to locations_path
    end
  end

end
