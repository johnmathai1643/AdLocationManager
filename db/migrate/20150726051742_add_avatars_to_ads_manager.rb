class AddAvatarsToAdsManager < ActiveRecord::Migration
  def self.up
    change_table :ads_managers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :ads_managers, :avatar
  end	
end
