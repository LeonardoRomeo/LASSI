class AddThirdpartToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :thirdpart, :boolean
  end
end
