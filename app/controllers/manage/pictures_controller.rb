class Manage::PicturesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :xml, :json, :only => [:index, :show, :new, :edit]
  #validates_attachment_presence

  def index
    respond_with(@pictures = Picture.all)
  end

  def show
    respond_with(@picture = Picture.find(params[:id], :include => :venues))
  end

  def new
    respond_with(@picture = Picture.new)
  end

  def edit
    respond_with(@picture = Picture.find(params[:id], :include => :venues))
  end

  def create
    @picture = Picture.new(params[:picture])

    respond_to do |format|
      if @picture.save
        format.html { redirect_to [:manage, @picture], :notice => 'Picture was successfully created.' }
        format.json { render :json => @picture, :status => :created, :location => @picture }
      else
        format.html { render :action => "new" }
        format.json { render :json => @picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update
    @picture = Picture.find(params[:id], :include => :venues)

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to [:manage, @picture], :notice => 'Picture was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to manage_pictures_url }
      format.json { head :ok }
    end
  end
end
