class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :date
      t.time :time

    #  t.references :library
     # t.references :number
      #t.references :size

      t.timestamps null: false
    end
  end
end
