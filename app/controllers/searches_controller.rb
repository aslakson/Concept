class SearchesController < ApplicationController

  def show
    @search = Search.find(params[:id])
    @locations = Location.all
    @maps = @locations.to_gmaps4rails do |location, marker|
      marker.infowindow render_to_string(:partial => "/locations/marker", :locals => { :location => location}).gsub(/\n/, '').gsub(/"/, '\"')
      marker.title   location.name
      marker.sidebar "i'm the sidebar"
      marker.json    "\"id\": #{location.id}"
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @search }
    end
  end

  def new
    @search = Search.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @search }
    end
  end

  def create
    @search = Search.new(params[:search])

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search }
        format.json { render :json => @search, :status => :created, :location => @search }
      else
        format.html { render :action => "new" }
        format.json { render :json => @search.errors, :status => :unprocessable_entity }
      end
    end
  end
end
