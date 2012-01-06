class Manage::LocationsController < ManageController
  before_filter :authenticate_user!

  respond_to :html, :xml, :json
  load_and_authorize_resource :organization
  #load_and_authorize_resource :location, :through => :organization

  def index
    @locations = Location.all

    respond_with(@locations)
  end

  def show
    respond_with(@location = Location.find(params[:id]))
  end

  def new
    respond_with(@location = Location.new)
  end

  def edit
    respond_with(@location = Location.find(params[:id]))
  end

  def create
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to [:manage, @location], :notice => 'Location was successfully created.' }
        format.json { render :json => @location, :status => :created, :location => @location }
      else
        format.html { render :action => "new" }
        format.json { render :json => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to [:manage, @location], :notice => 'Location was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @location.errors, :status => :unprocessable_entity }
      end
    end
  end
end
