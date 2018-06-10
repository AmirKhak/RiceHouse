class CreateProducts < ActiveRecord::Migration[5.1]
  def up
    create_table :products do |t|
      t.string "title", :limit => 60, :null => false
      t.string "description", :limit => 500, :null => false
      t.integer "rate", :limit => 5
      add_attachment :users, :avatar
      t.timestamps
    end  
  end

  def down
    drop_table :users
  end

end
