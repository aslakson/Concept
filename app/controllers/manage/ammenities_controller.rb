class Manage::AmmenitiesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :xml, :json, :only => [:index, :show, :new, :edit]

  def index
    respond_with(@ammenities = Ammenity.all)
  end

  def show
    respond_with(@ammenity = Ammenity.find(params[:id]))
  end

  def new
    respond_with(@ammenity = Ammenity.new)
  end

  def edit
    respond_with(@ammenity = Ammenity.find(params[:id]))
  end

  def create
    @ammenity = Ammenity.new(params[:ammenity])

    respond_to do |format|
      if @ammenity.save
        format.html { redirect_to [:manage, @ammenity], :notice => 'Ammenity was successfully created.' }
        format.json { render :json => @ammenity, :status => :created, :location => @ammenity }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ammenity.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @ammenity = Ammenity.find(params[:id])

    respond_to do |format|
      if @ammenity.update_attributes(params[:ammenity])
        format.html { redirect_to [:manage, @ammenity], :notice => 'Ammenity was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ammenity.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @ammenity = Ammenity.find(params[:id])
    @ammenity.destroy

    respond_to do |format|
      format.html { redirect_to manage_ammenities_url }
      format.json { head :ok }
    end
  end
end
