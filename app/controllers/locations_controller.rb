class LocationsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    respond_with(@locations = Location.all, @maps = @locations.to_gmaps4rails)
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @location }
    end
  end
end
