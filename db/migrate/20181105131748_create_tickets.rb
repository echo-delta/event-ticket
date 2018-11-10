class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
			t.references :user, foreign_key: true, null: false
    	t.references :invoice, foreign_key: true
    	t.references :event, foreign_key: true, null: false
    	t.references :section, foreign_key: true, null:false

      t.timestamps
    end
  end
end
