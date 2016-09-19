class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :number
      t.string :size
      t.string :name

      t.timestamps
    end
  end
end
