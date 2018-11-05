class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :description
      t.references :venue

      t.timestamps
    end
  end
end
