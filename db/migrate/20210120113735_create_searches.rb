class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :name
      t.string :wifi
      t.string :prese
      t.string :riscaldamento

      t.timestamps
    end
  end
end
