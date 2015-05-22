class API::AdsManagerController < ApplicationController

  def index
    # ads = AdsManager.all
    lat = params[:lat]
    lon = params[:lon]
    
    adlocation = AdsManager.where("lat between '13.011111' and '13.444444' and lon between '80.000001' and '80.9999999'")
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