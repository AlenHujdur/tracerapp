class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new(params[:location])
  end

  def create
    if @location.save
      flash[:notice] = "Location saved!"
    end
  end

end
