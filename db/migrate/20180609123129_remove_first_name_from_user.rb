class RemoveFirstNameFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :fistname
    remove_column :users, :lastname
  end
end
