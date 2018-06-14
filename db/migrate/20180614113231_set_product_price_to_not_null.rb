class SetProductPriceToNotNull < ActiveRecord::Migration[5.1]
  def up
    change_column :products, :price, :decimal, default: 0, null: false
  end

  def down
    change_column :products, :price, :decimal, default: nil, null: true
  end

end
