class Manage::AmmenitiesController < ApplicationController
  # GET /ammenities
  # GET /ammenities.json
  def index
    @ammenities = Ammenity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ammenities }
    end
  end

  # GET /ammenities/1
  # GET /ammenities/1.json
  def show
    @ammenity = Ammenity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ammenity }
    end
  end

  # GET /ammenities/new
  # GET /ammenities/new.json
  def new
    @ammenity = Ammenity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ammenity }
    end
  end

  # GET /ammenities/1/edit
  def edit
    @ammenity = Ammenity.find(params[:id])
  end

  # POST /ammenities
  # POST /ammenities.json
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

  # PUT /ammenities/1
  # PUT /ammenities/1.json
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

  # DELETE /ammenities/1
  # DELETE /ammenities/1.json
  def destroy
    @ammenity = Ammenity.find(params[:id])
    @ammenity.destroy

    respond_to do |format|
      format.html { redirect_to manage_ammenities_url }
      format.json { head :ok }
    end
  end
end
