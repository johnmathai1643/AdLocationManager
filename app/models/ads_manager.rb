class AdsManager < ActiveRecord::Base
	 validates :name, presence: true, length: { minimum: 5 }
     geocoded_by :address, :latitude => :lat, :longitude => :lon                   
end
