# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100303050316) do

  create_table "contacts", :force => true do |t|
    t.string   "last_name",    :limit => 64
    t.string   "first_name",   :limit => 64
    t.string   "company_name", :limit => 64
    t.string   "title",        :limit => 64
    t.string   "email",        :limit => 64
    t.integer  "telephone",    :limit => 10,  :precision => 10, :scale => 0
    t.integer  "mobile",       :limit => 10,  :precision => 10, :scale => 0
    t.integer  "fax",          :limit => 10,  :precision => 10, :scale => 0
    t.string   "blog",         :limit => 128
    t.string   "facebook",     :limit => 128
    t.string   "twitter",      :limit => 128
    t.integer  "street_no"
    t.string   "street_name",  :limit => 32
    t.string   "street_type",  :limit => 24
    t.string   "street_dir",   :limit => 2
    t.string   "city",         :limit => 20
    t.string   "state",        :limit => 2
    t.integer  "zip",          :limit => 5,   :precision => 5,  :scale => 0
    t.integer  "owner_id"
    t.integer  "tenant_id"
    t.integer  "buyer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street_alpha", :limit => 5
  end

  create_table "owners", :force => true do |t|
    t.integer  "account_no"
    t.integer  "percentage_own"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parcels", :force => true do |t|
    t.integer "acct_no"
    t.string  "parcel_nb",    :limit => 20
    t.string  "liber",        :limit => 10
    t.string  "folio",        :limit => 10
    t.string  "acct_type",    :limit => 15
    t.string  "street_no",    :limit => 10
    t.string  "street_dir",   :limit => 2
    t.string  "street_name",  :limit => 30
    t.string  "street_type",  :limit => 5
    t.string  "street_alpha", :limit => 5
    t.string  "city",         :limit => 20
    t.string  "state",        :limit => 2
    t.integer "zip"
    t.string  "prop_type",    :limit => 30
    t.string  "value_type",   :limit => 20
    t.string  "abst_code",    :limit => 4
    t.string  "abst_desc",    :limit => 40
    t.integer "occ_code"
    t.string  "occ_desc",     :limit => 40
    t.integer "blt_as_id"
    t.string  "blt_as_desc",  :limit => 50
    t.decimal "lotsf",                      :precision => 15, :scale => 2
    t.decimal "netsf",                      :precision => 15, :scale => 2
    t.decimal "grossf",                     :precision => 15, :scale => 2
    t.decimal "acres",                      :precision => 15, :scale => 2
    t.integer "stories"
    t.decimal "park_space",                 :precision => 15, :scale => 2
    t.string  "yr_blt",       :limit => 50
    t.string  "zoning",       :limit => 20
    t.decimal "lat",                        :precision => 15, :scale => 10
    t.decimal "lng",                        :precision => 15, :scale => 10
  end

  add_index "parcels", ["acct_no"], :name => "index_parcels_on_acct_no"

end
