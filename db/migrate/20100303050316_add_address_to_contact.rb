class AddAddressToContact < ActiveRecord::Migration
  def self.up
    add_column :contacts, :street_alpha, :string, :limit=>5
  end

  def self.down
    remove_column :contacts, :street_alpha
  end
end
