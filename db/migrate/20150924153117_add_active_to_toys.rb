class AddActiveToToys < ActiveRecord::Migration
  def change
    add_column :toys, :active, :boolean, default: true
  end
end
