class AdsManager < ActiveRecord::Base
	 validates :name, presence: true, length: { minimum: 5 }
     geocoded_by :address
	 reverse_geocoded_by :latitude, :longitude
     after_validation :geocode, :reverse_geocode


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png", :url  => ":s3_domain_url", :path => "public/avatars/:id/:style_:basename.:extension", :storage => :fog, :fog_credentials => {provider: 'AWS', aws_access_key_id: 'AKIAJV42PGGRCX7MUIGA', aws_secret_access_key: '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', :region => 'us-west-2'}, fog_directory: 'adlocation-dev'


  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end	
