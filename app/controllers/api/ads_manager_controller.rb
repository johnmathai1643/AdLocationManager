class API::AdsManagerController < ApplicationController

  def index
    # ads = AdsManager.all
    lat = params[:lat].to_i
    lon = params[:lon].to_i
    
    adlocation = AdsManager.where("lat between '#{lat+0.011111}' and '#{lat+0.444444}' and lon between '#{lon+0.000001}' and '#{lon+0.9999999}'")
    adlocation = {'adlocation' => adlocation}
    respond_to do |format|
      format.json { render :json => adlocation, status: 201 }
    end
  end

  # def adlocations
  #   lat = params[:lat]
  #   logger.info lat
  #   adlocations_list = AdsManager.all
  #   render json: adlocations_list, status: 201 
  # end

end