class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :content
      t.integer :company_id
      t.string :place
      t.string :job

      t.timestamps
    end
  end
end
