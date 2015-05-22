class CreateAdsManagers < ActiveRecord::Migration
  def change
      create_table :ads_managers do |t|
      t.text :name
      t.decimal :lat, :precision => 9, :scale => 6, :null => false
      t.decimal :lon, :precision => 9, :scale => 6, :null => false
      t.string :snippet
      t.string :image
      t.timestamps
    end
  end
end
