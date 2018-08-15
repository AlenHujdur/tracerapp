class CamerasController < ApplicationController

  def new
    @camera = Camera.new
  end
  
  def create
    @location = Location.find(params[:location_id])
    @camera = @location.cameras.create(camera_params)
    if @camera.save
      flash[:notice] = "Camera saved!"
      respond_to do |format|    
      format.html { redirect_to location_path(@location), notice: 'Picture was successfully created.' }
    end
    else
       render 'new'
    end
  end

  private
  
  def camera_params
    params.permit(:image)
  end

end
