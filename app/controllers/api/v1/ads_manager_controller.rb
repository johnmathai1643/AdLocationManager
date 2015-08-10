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
	    adlocation = AdsManager.near([lat, lon], 5)
      
      if UserLocation.exists?(:user_id => current_user.id)
         user_location = UserLocation.where(:user_id => current_user.id).update_all(:latitude => lat,:longitude => lon)
      else
         UserLocation.create(:user_id => current_user.id, :sour => "source", :dest => "destination", :freq => 1, :latitude => lat, :longitude => lon)
      end

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

  def get_frequent_ads
    if user_signed_in?
      adlocation = []

      params[:location].each do |location|
        # logger.info(location["latitude"])
        # logger.info(i)
        # logger.info(location["longitude"])
        # i = i + 1
        adlocation = adlocation + AdsManager.near([location["latitude"].to_f, location["longitude"].to_f], 5)
      end
      
      # if UserLocation.exists?(:user_id => current_user.id)
      #    user_location = UserLocation.where(:user_id => current_user.id).update_all(:latitude => lat,:longitude => lon)
      # else
      #    UserLocation.create(:user_id => current_user.id, :sour => "source", :dest => "destination", :freq => 1, :latitude => lat, :longitude => lon)
      # end
      adlocation = adlocation.uniq

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