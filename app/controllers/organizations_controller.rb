class OrganizationsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    respond_with(@teams = Organization.all)
  end
end
