class AddAddressToFrqManager < ActiveRecord::Migration
  def change
    add_column :freq_managers, :address, :string
  end
end
