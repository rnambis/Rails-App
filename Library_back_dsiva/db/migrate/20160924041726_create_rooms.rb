class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :number
      t.string :size
      t.references :library
      t.timestamps null: false
    end
  end
end
