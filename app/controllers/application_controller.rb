class ApplicationController < ActionController::Base
  before_filter :setup_simple_search
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
  
  def setup_simple_search
    @simpleSearch = Search.new
  end
end
