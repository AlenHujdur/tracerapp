class CameraController < ApplicationController

  def new
    @camera = Camera.new
  end

end
