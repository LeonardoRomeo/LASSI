class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :num_posti_tot
      t.integer :num_posti_liberi
      t.time :h_ape
      t.time :h_chiu
      t.string :foto
      t.boolean :wifi
      t.boolean :prese
      t.boolean :riscaldamento
      t.references :student

      t.timestamps
    end
  end
end
