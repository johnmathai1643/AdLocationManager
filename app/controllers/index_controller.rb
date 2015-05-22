class IndexController < ApplicationController
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

  def index
  	if user_signed_in?
  	   redirect_to :action => 'dashboard', :controller => 'ads_manager'
    end 
  end

end
