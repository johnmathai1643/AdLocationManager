class RenameLatLon < ActiveRecord::Migration
  def change
  	rename_column :ads_managers, :lat, :latitude
  	rename_column :ads_managers, :lon, :longitude
  	rename_column :freq_managers, :lat, :latitude
  	rename_column :freq_managers, :lon, :longitude
  end
end
