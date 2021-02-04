class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :nome
      t.string :argument
      t.string :file
      t.references :student

      t.timestamps
    end
  end
end
