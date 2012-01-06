class Manage::UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])

  end

  def home
    @organizations = Organization.owned_by(current_user.id).includes(:locations).all
    @locations = Location.belonging_to(@organizations.map(&:id))
    @map = @locations.to_gmaps4rails do |location, marker|
      marker.infowindow render_to_string(:partial => "/locations/marker", :locals => { :location => location}).gsub(/\n/, '').gsub(/"/, '\"')
      marker.title   location.name
      marker.sidebar "i'm the sidebar"
      marker.json    "\"id\": #{location.id}"
    end
  end
end
