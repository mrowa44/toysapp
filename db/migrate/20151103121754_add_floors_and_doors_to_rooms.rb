class AddFloorsAndDoorsToRooms < ActiveRecord::Migration
  def change
    add_reference :rooms, :floor, index: true, foreign_key: true
    add_reference :rooms, :door, index: true, foreign_key: true
  end
end
