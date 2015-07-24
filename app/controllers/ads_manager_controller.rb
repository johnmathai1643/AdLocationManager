class AdsManagerController < ApplicationController
  protect_from_forgery with: :exception
  before_filter :authenticate_admin!

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

      @ads_manager = AdsManager.near([@lat, @lon], 50)
    end

    def get_ad_location
    	@lat = params[:lat].to_f
    	@lon = params[:lon].to_f

    	@ads_manager = AdsManager.near([@lat, @lon], 50)
	    respond_to do |format|
	        format.js
	    end
    end

    def dashboard
      @ads_manager = AdsManager.all
    end

    def users
      @users = User.joins(:user_locations).select("*").where('user_locations.user_id = users.id').all
    end

    def index
      @ads_manager = AdsManager.all
    end

  	def new 
   
   	end

  	def create 
  	  @ads_manager = AdsManager.new(ads_manager_params)
      
          name = params[:ads_manager][:image].original_filename
          directory = "public/image"
          path = File.join(directory, name)
          File.open(path, "wb") { |f| f.write(params[:ads_manager][:image].read) }
          @ads_manager.image = "image/"+params[:ads_manager][:image].original_filename.to_s
      
      @ads_manager.save
      redirect_to action: "index"
    end
  	
   	def edit
      @ads_manager = AdsManager.find(params[:id])
    end

    def update
  	  @ads_manager = AdsManager.find(params[:id])
      if params[:ads_manager][:image] != nil
          name = params[:ads_manager][:image].original_filename
          directory = "public/image"
          path = File.join(directory, name)
          File.open(path, "wb") { |f| f.write(params[:ads_manager][:image].read) }
          @ads_manager.image = "image/"+params[:ads_manager][:image].original_filename.to_s
  	  end
      if @ads_manager.update(ads_manager_params)
        @ads_manager.save
  	    redirect_to @ads_manager
  	  else
  	    render 'edit'
  	  end
  	end
  	
  	def show
       @ads_manager = AdsManager.find(params[:id])
    end

    def destroy
  	  @ads_manager = AdsManager.find(params[:id])
  	  @ads_manager.destroy
  	  redirect_to ads_manager_index_path
  	end

 private
   def ads_manager_params
     params.require(:ads_manager).permit(:name, :latitude, :longitude, :snippet)
   end

end
