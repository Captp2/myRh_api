class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :email
      t.string :password_digest
      t.string :last_name
      t.string :token
      t.string :activation_token
      t.integer :role

      t.timestamps
    end
  end
end
