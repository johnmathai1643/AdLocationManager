class AddLatLonToFreqManagers < ActiveRecord::Migration
  def change
  	add_column :freq_managers, :lat, :decimal, :precision => 9, :scale => 6, :null => false
    add_column :freq_managers, :lon, :decimal, :precision => 9, :scale => 6, :null => false
  end
end
