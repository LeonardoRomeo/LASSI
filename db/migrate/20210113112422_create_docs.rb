class CreateDocs < ActiveRecord::Migration[5.2]
  def change
    create_table :docs do |t|
      t.string :name
      t.string :argument
      t.string :file
      t.references :student

      t.timestamps
    end
  end
end
