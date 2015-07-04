class RenameTableToUserLocation < ActiveRecord::Migration
  def change
  	 rename_table :freq_managers, :user_locations
  end
end
