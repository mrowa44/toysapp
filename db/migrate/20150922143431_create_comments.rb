class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.references :commentable, index: true, polymorphic: true

      t.timestamps null: false
    end
  end
end
