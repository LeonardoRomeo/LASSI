class RemoveFotoFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :foto, :string
  end
end
