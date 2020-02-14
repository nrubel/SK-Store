class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :categories, array: true
      t.float :price
      t.integer :quantity
      t.json :specification, array: true
      t.json :attributes, array: true
      t.string :tags, array: true

      t.timestamps
    end
  end
end
