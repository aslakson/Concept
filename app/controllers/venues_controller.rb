class VenuesController < ApplicationController
  respond_to :html, :xml, :json, :only => [:index, :show, :new, :edit]

  def index
    respond_with(@venues = Venue.all)
  end

  def show
    respond_with(@venue = Venue.find(params[:id]), @map = @venue.location.to_gmaps4rails)
  end
end
