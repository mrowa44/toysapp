class AddOpenBooleanToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :open, :boolean, default: true
  end
end
