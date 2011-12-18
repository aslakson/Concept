class Manage::VenuesController < ApplicationController
  respond_to :html, :xml, :json, :only => [:index, :show, :new, :edit]

  def index
    respond_with(@venues = Venue.all)
  end

  def show
    respond_with(@venue = Venue.find(params[:id]))
  end

  def new
    respond_with(@venue = Venue.new)
  end

  def edit
    respond_with(@venue = Venue.find(params[:id]))
  end

  def create
    @venue = Venue.new(params[:venue])

    respond_to do |format|
      if @venue.save
        format.html { redirect_to [:manage, @venue], :notice => 'Venue was successfully created.' }
        format.json { render :json => @venue, :status => :created, :location => @venue }
      else
        format.html { render :action => "new" }
        format.json { render :json => @venue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /venues/1
  # PUT /venues/1.json
  def update
    @venue = Venue.find(params[:id])

    respond_to do |format|
      if @venue.update_attributes(params[:venue])
        format.html { redirect_to [:manage, @venue], :notice => 'Venue was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @venue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy

    respond_to do |format|
      format.html { redirect_to manage_venues_url }
      format.json { head :ok }
    end
  end
end
