class LocationsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    respond_with(@locations = Location.all, @maps = @locations.to_gmaps4rails)
  end

  def show
    respond_with(@location = Location.find(params[:id], :include => :venues), @map = @location.to_gmaps4rails)
  end
end
