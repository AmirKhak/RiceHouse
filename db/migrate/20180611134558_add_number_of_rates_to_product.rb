class AddNumberOfRatesToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :totalRates, :integer
  end
end
