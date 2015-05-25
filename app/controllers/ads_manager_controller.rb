class AdsManagerController < ApplicationController
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

	layout 'application'
    
    def fetch_location
    	@lat = params[:lat]
    	@lon = params[:lon]
	    respond_to do |format|
	        format.js
	    end
    end

    def check_ad_location
     # Delhi coordinates
      @lat = 28.6139
      @lon = 77.2090
      @ads_manager = AdsManager.all
    end

    def get_ad_location
    	@lat = params[:lat].to_f
    	@lon = params[:lon].to_f
        @ads_manager = AdsManager.where("lat between '#{@lat}' and '#{@lat+0.9999999}' and lon between '#{@lon}' and '#{@lon+0.9999999}'")

	    respond_to do |format|
	        format.js
	    end
    end


    def dashboard
      @ads_manager = AdsManager.all
    end

    def index
      @ads_manager = AdsManager.all
    end

	def new 
 
 	end

	def create 
	  # render plain: params[:ads_manager].inspect
	  @ads_manager = AdsManager.new(ads_manager_params)
	  @ads_manager.save
  	  redirect_to action: "index"
    end
	
 	def edit
      @ads_manager = AdsManager.find(params[:id])
    end

    def update
	  @ads_manager = AdsManager.find(params[:id])

	  if @ads_manager.update(ads_manager_params)
	    redirect_to @ads_manager
	  else
	    render 'edit'
	  end
	end
	
	def show
      @ads_manager = AdsManager.find(params[:id])
    end

    def destroy
	  @ads_manager = Article.find(params[:id])
	  @ads_manager.destroy
	  redirect_to articles_path
	end

 private
   def ads_manager_params
     params.require(:ads_manager).permit(:name, :lat, :lon, :snippet)
   end

end
