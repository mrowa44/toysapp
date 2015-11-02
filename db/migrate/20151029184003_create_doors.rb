class CreateDoors < ActiveRecord::Migration
  def change
    create_table :doors do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
