class Manage::LocationsController < ManageController
  respond_to :html, :xml, :json
  load_and_authorize_resource :organization
  load_and_authorize_resource :location, :through => :organization

  def index
    @locations = Location.all

    respond_with(@locations)
  end

  def show
    respond_with(@location)
  end
end
