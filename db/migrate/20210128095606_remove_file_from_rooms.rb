class RemoveFileFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :file, :string
  end
end
