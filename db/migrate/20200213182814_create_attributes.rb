class CreateAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :attributes do |t|
      t.string :name
      t.json :values, array: true

      t.timestamps
    end
    add_index :attributes, :name, unique: true
  end
end
