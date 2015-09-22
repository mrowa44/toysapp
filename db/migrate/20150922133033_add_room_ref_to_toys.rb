class AddRoomRefToToys < ActiveRecord::Migration
  def change
    add_reference :toys, :room, index: true, foreign_key: true
  end
end
