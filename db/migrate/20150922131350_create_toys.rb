class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :name
      t.string :color
      t.integer :price
      t.integer :available_num

      t.timestamps null: false
    end
  end
end
