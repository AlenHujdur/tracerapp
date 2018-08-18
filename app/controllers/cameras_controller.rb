class CamerasController < ApplicationController
  
  def create
    @location = Location.find(params[:id])
    
    if @camera = @location.cameras.create(camera_params)
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
    params.require(:camera).permit(:image)
  end

end
