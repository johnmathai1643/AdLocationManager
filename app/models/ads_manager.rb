class AdsManager < ActiveRecord::Base
	 validates :name, presence: true, length: { minimum: 5 }
     geocoded_by :address
	 reverse_geocoded_by :latitude, :longitude
     after_validation :geocode, :reverse_geocode
end	
