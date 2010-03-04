class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :assigned_to
      t.integer :completed_by
      t.string  :name,        :limit=>200
      t.integer :contact_id
      t.integer :contact_type,  :limit=>200
      t.string  :priority,    :limit=>32
      t.string  :category,    :limit=>32
      t.string  :bucket,      :limit=>32
      t.datetime :due_at
      t.datetime :completed_at
      t.datetime :deleted_at
      t.timestamps
      #  add_index :tasks, [ :user_id, :name, :deleted_at ], :unique => true
      #  add_index :tasks, :assigned_to
      
    end
  end

  def self.down
    drop_table :tasks
  end
  
end
