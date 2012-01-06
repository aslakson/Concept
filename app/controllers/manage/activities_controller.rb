class Manage::ActivitiesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :xml, :json, :only => [:index, :show, :new, :edit]

  def index
    respond_with(@activities = Activity.all)
  end

  def show
    respond_with(@activity = Activity.find(params[:id]))
  end

  def new
    respond_with(@activity = Activity.new)
  end

  def edit
    respond_with(@activity = Activity.find(params[:id]))
  end

  def create
    @activity = Activity.new(params[:activity])

    respond_to do |format|
      if @activity.save
        format.html { redirect_to [:manage, @activity], :notice => 'Activity was successfully created.' }
        format.json { render :json => @activity, :status => :created, :location => @activity }
      else
        format.html { render :action => "new" }
        format.json { render :json => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to [:manage, @activity], :notice => 'Activity was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to manage_activities_url }
      format.json { head :ok }
    end
  end
end
