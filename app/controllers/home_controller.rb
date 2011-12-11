class HomeController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @locations = Location.all
    @maps = @locations.to_gmaps4rails do |location, marker|
      marker.infowindow render_to_string(:partial => "/locations/marker", :locals => { :location => location}).gsub(/\n/, '').gsub(/"/, '\"')
      marker.title   location.name
      marker.sidebar "i'm the sidebar"
      marker.json    "\"id\": #{location.id}"
    end
  end
end
