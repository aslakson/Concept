class Manage::LocationsController < ManageController
  respond_to :html, :xml, :json
  load_and_authorize_resource :organization
  load_and_authorize_resource :location, :through => :organization

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all

    respond_with(@locations)
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    respond_with(@location)
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    respond_with(@location)
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = @organization.locations.build(params[:location])

    respond_to do |format|
      if @location.save
        respond_with(@location, :location => manage_organization_locations_url)
      else
        respond_with(@location, :location => new_manage_organization_location)
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
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

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to manage_locations_url }
      format.json { head :ok }
    end
  end
end
