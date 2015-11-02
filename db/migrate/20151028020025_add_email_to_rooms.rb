class AddEmailToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :email, :string
  end
end
