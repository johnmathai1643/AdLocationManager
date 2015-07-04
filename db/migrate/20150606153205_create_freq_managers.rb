class CreateFreqManagers < ActiveRecord::Migration
  def change
    create_table :freq_managers do |t|
      t.string :sour
      t.string :dest
      t.integer :freq
      t.integer :user_id
      t.timestamps
    end
  end
end
