class IndexController < ApplicationController
  protect_from_forgery with: :exception
  before_filter :authenticate_admin!
  
  def index
  	if admin_signed_in?
  	   redirect_to :action => 'dashboard', :controller => 'ads_manager'
    end 
  end

end
