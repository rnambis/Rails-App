class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :room_id
      t.string :size
      t.string :library
      t.string :status

      t.timestamps null: false
    end
  end
end
