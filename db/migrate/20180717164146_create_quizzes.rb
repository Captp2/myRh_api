class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.string :label
      t.belongs_to :offer, index: true
      t.timestamps
    end
  end
end
