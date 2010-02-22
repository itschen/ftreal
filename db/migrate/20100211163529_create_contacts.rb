class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
    	t.string    :last_name,     :limit=>64
    	t.string    :first_name,    :limit=>64
    	t.string    :company_name,  :limit=>64
    	t.string    :title,         :limit=>64
    	t.string    :email,         :limit=>64
    	t.decimal   :telephone,     :precision=>10, :scale=>0
    	t.decimal   :mobile,        :precision=>10, :scale=>0
    	t.decimal   :fax,           :precision=>10, :scale=>0
    	t.string    :blog,          :limit =>128
    	t.string    :facebook,      :limit =>128
    	t.string    :twitter,       :limit =>128
    	t.integer   :street_no
    	t.string    :street_name,   :limit=>32
    	t.string    :street_type,   :limit=>24
    	t.string    :street_dir,    :limit=>2
    	t.string    :city,          :limit=>20
    	t.string    :state,         :limit=>2
    	t.decimal   :zip,           :precision=>5, :scale=>0
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
