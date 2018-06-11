class ChangeRateTypeInProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :rate, :float
  end
end
