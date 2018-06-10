class ChangeProductAvatarColumn < ActiveRecord::Migration[5.1]
  def change
    add_attachment :products, :avatar
  end
end
