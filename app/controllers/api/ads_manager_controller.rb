class API::AdsManagerController < ApplicationController

  def index
    @ads = AdsManager.all
    respond_to do |format|
      format.json { render :json => @ads }
    end
  end

  def create 
    # @ads = AdsManager.all
    respond_to do |format|
      format.json { render :json => @ads }
    end
  end

  def show

  end

end