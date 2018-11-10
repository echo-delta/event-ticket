class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
    	t.references :user, foreign_key: true, null: false
    	t.references :event, foreign_key: true, null: false
    	t.integer :is_paid, null: false

      t.timestamps
    end
  end
end
