class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.string "email", :limit => 60, :null => false
      t.string "fistname", :limit => 30, :null => false
      t.string "lastname", :limit => 35, :null => false
      t.string "password", :limit => 30, :null => false
      t.timestamps null: false
    end
  end

  def down
    drop_table :users
  end
end
