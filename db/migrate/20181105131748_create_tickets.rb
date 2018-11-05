class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
    	t.references :event, index: true, foreign_key: true

      t.timestamps
    end
  end
end
