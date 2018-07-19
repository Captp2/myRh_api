class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.belongs_to :user, index: true
      t.belongs_to :question, index: true
      t.belongs_to :answer, index: true
      t.timestamps
    end
  end
end
