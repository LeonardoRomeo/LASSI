class RemoveAdminFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :admin, :boolean
  end
end
