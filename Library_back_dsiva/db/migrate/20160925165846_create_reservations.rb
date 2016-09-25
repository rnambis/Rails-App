class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :size
      t.string :library
      t.date :date
      t.time :time

      t.timestamps null: false
    end
  end
end
