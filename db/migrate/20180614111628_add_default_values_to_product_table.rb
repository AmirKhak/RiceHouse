class AddDefaultValuesToProductTable < ActiveRecord::Migration[5.1]

  def up
    change_column :products, :price, :decimal, default: 0
    change_column :products, :rate, :float, default: 0
    change_column :products, :totalRates, :integer, default: 0
  end

  def down
    change_column :products, :price, :decimal, default: nil
    change_column :products, :rate, :float, default: nil
    change_column :products, :totalRates, :integer, default: nil
  end

end
