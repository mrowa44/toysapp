class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :number
      t.integer :number_of_toys

      t.timestamps null: false
    end
  end
end
