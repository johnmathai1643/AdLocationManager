class UserLocation < ActiveRecord::Base
	belongs_to :users
	geocoded_by :address
	reverse_geocoded_by :latitude ,:longitude
    after_validation :geocode, :reverse_geocode
end
