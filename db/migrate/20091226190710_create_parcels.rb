class CreateParcels < ActiveRecord::Migration
  def self.up
    create_table :parcels do |t|
      t.integer  :acct_no
      t.string   :parcel_nb, :limit=>20
      t.string   :liber, :limit=>10
      t.string   :folio, :limit=>10
      t.string   :acct_type, :limit=>15
      t.string   :street_no, :limit=>10
      t.string   :street_dir, :limit=>2
      t.string   :street_name, :limit=>30
      t.string   :street_type, :limit=>5
      t.string   :street_alpha, :limit=>5
      t.string   :city, :limit=>20
      t.string   :state, :limit=>2
      t.integer  :zip, :limit=>9
      t.string   :prop_type, :limit=>30
      t.string   :value_type, :limit=>20
      t.string   :abst_code, :limit=>4
      t.string   :abst_desc, :limit=>40
      t.integer  :occ_code,  :limit=>4
      t.string   :occ_desc,  :limit=>40
      t.integer  :blt_as_id
      t.string   :blt_as_desc, :limit=>50
      t.decimal  :lotsf, :precision=>15, :scale=>2
      t.decimal  :netsf, :precision=>15, :scale=>2
      t.decimal  :grossf, :precision=>15, :scale=>2
      t.decimal  :acres, :precision=>15, :scale=>2
      t.integer  :stories
      t.decimal  :park_space, :precision=>15, :scale=>2
      t.string   :yr_blt, :limit=>50
      t.string   :zoning, :limit=>20
      t.decimal  :lat, :precision=>15, :scale=>10
      t.decimal  :lng, :precision=>15, :scale=>10
      t.timestamps
    end
    add_index :parcels, :acct_no
  end

  def self.down
    drop_table :parcels
  end
end