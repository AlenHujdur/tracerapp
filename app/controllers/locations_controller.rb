class LocationsController < ApplicationController
  before_action :require_user, except: [:show, :index]
  def index
    @locations = Location.all
    respond_to do |format|
      format.html
      format.xml {render xml: @locations}
      format.json {render json: @locations}
      format.csv { send_data @locations.to_csv }
    end
  end

  def new
    @location = Location.new
    @camera = Camera.new
    #@cameras = @location.cameras.create(camera_params)
  end
  
  def show
    location_id = params[:id]
    @location = Location.find(location_id)
    @camera = @location.image
      lat = @location.latitude
      long = @location.longitude
    @map = @location.newmap(lat,long)
  end

  def create
    @location = Location.new(location_params)
    @camera = Camera.new(camera_params)
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
    params.require(:camera).permit(:image)
  end

  def location_params
    params.require(:location).permit(:latitude, :longitude, :info, :user_id, :map_image, :camera_id)
  end

  def require_same_user
    if current_user != @location.user
      flash[:danger] = "You can only edit your own location"
      redirect_to locations_path
    end
  end

end
