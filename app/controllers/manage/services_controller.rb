class Manage::ServicesController < ApplicationController
  respond_to :html, :xml, :json, :only => [:index, :show, :new, :edit]

  def index
    respond_with(@services = Service.all)
  end

  def show
    respond_with(@service = Service.find(params[:id]))
  end

  def new
    respond_with(@service = Service.new)
  end

  def edit
    respond_with(@service = Service.find(params[:id]))
  end

  def create
    @service = Service.new(params[:service])

    respond_to do |format|
      if @service.save
        format.html { redirect_to [:manage, @service], :notice => 'Service was successfully created.' }
        format.json { render :json => @service, :status => :created, :location => @service }
      else
        format.html { render :action => "new" }
        format.json { render :json => @service.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @service = Service.find(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html { redirect_to [:manage, @service], :notice => 'Service was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to manage_services_url }
      format.json { head :ok }
    end
  end
end
