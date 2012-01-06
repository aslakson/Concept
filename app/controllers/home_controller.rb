class HomeController < ApplicationController
  geocode_ip_address

  respond_to :html, :xml, :json

  def index
    origin = session[:geo_location] ? session[:geo_location] : [42.380001068115,-71.13289642334]
    @locations = Location.within(20, :origin => origin).all
    
    @maps = @locations.to_gmaps4rails do |location, marker|
      marker.infowindow render_to_string(:partial => "/locations/marker", :locals => { :location => location}).gsub(/\n/, '').gsub(/"/, '\"')
      marker.title   location.name
      marker.sidebar "i'm the sidebar"
      marker.json    "\"id\": #{location.id}"
    end
  end
end
