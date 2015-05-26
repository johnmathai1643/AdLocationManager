class API::AdsManagerController < ApplicationController

  def index
    lat = params[:lat].to_f
    lon = params[:lon].to_f
    
    adlocation = AdsManager.near([lat, lon], 50)
    adlocation = {'adlocation' => adlocation}
    respond_to do |format|
      format.json { render :json => adlocation, status: 201 }
    end
  end

end