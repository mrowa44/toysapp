class AddIndexToToysName < ActiveRecord::Migration
  def change
    add_index :toys, :name
  end
end
