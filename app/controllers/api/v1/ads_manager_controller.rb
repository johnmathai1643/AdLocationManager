class API::V1::AdsManagerController < ApplicationController

  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
  acts_as_token_authentication_handler_for User
  
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  
  def index
  	if user_signed_in?
	    lat = params[:lat].to_f
	    lon = params[:lon].to_f
	    
	    adlocation = AdsManager.near([lat, lon], 6.21371)
	    adlocation = {'adlocation' => adlocation}
	    respond_to do |format|
	      format.json { render :json => adlocation, status: 201 }
	    end
    else
    	respond_to do |format|
    	  sign_in = {'sign_in' => 'not signed in.'}	
	      format.json { render :json => sign_in, status: 201 }
	    end
    end
  end


end