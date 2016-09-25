class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :room_name
      t.string :name
      t.string :size
      t.string :library
      t.string :booked_at

      t.timestamps null: false
    end
  end
end
