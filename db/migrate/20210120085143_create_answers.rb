class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text "comment"
      t.references "post"
      t.references "student"
    end
  end
end
