class SetDefaultValueForToysNumToRoom < ActiveRecord::Migration
  def change
    change_column_default :rooms, :number_of_toys, 0
  end
end
