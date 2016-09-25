class AddSizeToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :size, :string
    add_column :reservations, :library, :string
  end
end
