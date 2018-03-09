class LocationsController < ApplicationController
  #skip_before_action :verify_authenticity_token
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
    @location.save
    flash[:notice] = "Location saved!"
      respond_to do |format|    
      format.html { redirect_to location_path(@location), notice: 'Location was successfully created.' }
      #format.js
      end
    #   format.xml {render xml: @locations}
    #   format.json {render json: @locations}
    #   format.csv {render csv: @locations}
    end
  end

  private
  def location_params
    params.require(:location).permit(:latitude, :longitude, :info)
  end
