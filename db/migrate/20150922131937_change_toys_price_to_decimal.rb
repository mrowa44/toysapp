class ChangeToysPriceToDecimal < ActiveRecord::Migration
  def change
    change_column :toys, :price, :decimal, precision: 10, scale: 2
  end
end
