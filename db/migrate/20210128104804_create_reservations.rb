class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date "data"
      t.references "room"
      t.references "student"
    end
  end
end
