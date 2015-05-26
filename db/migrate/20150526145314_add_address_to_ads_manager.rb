class AddAddressToAdsManager < ActiveRecord::Migration
  def change
    add_column :ads_managers, :address, :string
  end
end
