class CreateOfferTable < ActiveRecord::Migration[5.2]
	def change
		create_table :offer_tables do |t|
			t.string :label
			t.timestamp :begin
			t.timestamp :end
			t.string :last_name
			t.string :token

			t.timestamps
		end
	end
end
