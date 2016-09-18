class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :Room_No
      t.string :Size

      t.timestamps
    end
  end
end
