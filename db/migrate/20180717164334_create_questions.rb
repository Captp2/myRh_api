class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :label
      t.belongs_to :quiz, index: true
      t.timestamps
    end
  end
end
