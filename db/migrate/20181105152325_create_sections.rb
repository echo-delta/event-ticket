class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
    	t.string :name
    	t.integer :capacity
    	t.references :venue, null: false

      t.timestamps
    end
  end
end
