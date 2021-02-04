class RemoveThirdpartFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :thirdpart, :boolean
  end
end
