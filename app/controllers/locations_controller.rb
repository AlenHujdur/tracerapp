class LocationsController < ApplicationController
  #skip_before_action :verify_authenticity_token

  before_action :require_same_user, only: [:edit, :update]

  def index
    @locations = Location.all
    respond_to do |format|
      format.html
      format.xml {render xml: @locations}
      format.json {render json: @locations}
      format.csv { render csv: @locations }#{.to_csv}
      #format.xls { send_data @locations.to_csv(col_sep: "\t") }
    end
  end

  def new
    @location = Location.new
  end
  
  def show
    location_id = params[:id]
    @location = Location.find(location_id)
  end

  def create
    @location = Location.new(location_params)
    @location.chef = current_user
    if @location.save
      flash[:notice] = "Location saved!"
      respond_to do |format|    
      format.html { redirect_to location_path(@location), notice: 'Location was successfully created.' }
      #format.js
      end
    else
       render 'new'
    end
    #   format.xml {render xml: @locations}
    #   format.json {render json: @locations}
    #   format.csv {render csv: @locations}
  end

  private
  def location_params
    params.require(:location).permit(:latitude, :longitude, :info, :user_id)
  end

  def require_same_user
    if current_user != @location.user
      flash[:danger] = "You can only edit your own recipes"
      redirect_to locations_path
    end
  end

end
