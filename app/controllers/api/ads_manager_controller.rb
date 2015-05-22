class API::AdsManagerController < ApplicationController

  def index
    @ads = AdsManager.all
    respond_to do |format|
      format.json { render :json => @ads }
    end
  end

  def create 
    respond_to do |format|
      format.json { render :json => @ads }
    end
  end

  def show

  end

  def adlocations
    @adlocations = AdsManager.all
    respond_to do |format|
      format.json { render :json => @adlocations }
    end
  end

end