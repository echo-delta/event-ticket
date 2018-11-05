class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
    	t.references :user, index: true, foreign_key: true, null: false
    	t.references :event, index: true, foreign_key: true, null: false
    	t.integer :ticket_count, null: false
    	t.integer :is_paid, null: false

      t.timestamps
    end
  end
end
