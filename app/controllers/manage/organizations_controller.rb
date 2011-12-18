class Manage::OrganizationsController < ApplicationController
  respond_to :html, :xml, :json, :only => [:index, :show, :new, :edit]

  def index
    respond_with(@organizations = Organization.all)
  end

  def show
    respond_with(@organization = Organization.find(params[:id]))
  end

  def new
    respond_with(@organization = Organization.new)
  end

  def edit
    respond_with(@organization = Organization.find(params[:id]))
  end

  def create
    @organization = Organization.new(params[:organization])

    respond_to do |format|
      if @organization.save
        format.html { redirect_to [:manage, @organization], :notice => 'Organization was successfully created.' }
        format.json { render :json => @organization, :status => :created, :location => @organization }
      else
        format.html { render :action => "new" }
        format.json { render :json => @organization.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @organization = Organization.find(params[:id])

    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        format.html { redirect_to [:manage, @organization], :notice => 'Organization was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @organization.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to manage_organizations_url }
      format.json { head :ok }
    end
  end
end
