class AddRolesMaskToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :roles_mask, :integer
  end
end
