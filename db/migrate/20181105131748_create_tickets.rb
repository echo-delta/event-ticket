class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
			t.references :user, null: false
    	t.references :invoice
    	t.references :event, null: false
    	t.references :section, null:false

      t.timestamps
    end
  end
end
