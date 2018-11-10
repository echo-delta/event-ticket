class CreateBookedSections < ActiveRecord::Migration[5.1]
  def change
    create_table :booked_sections do |t|
    	t.references :invoice, foreign_key: true, null: false
    	t.references :section, foreign_key: true, null: false

      t.timestamps
    end
  end
end
