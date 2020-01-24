class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :route
      t.integer :position
      t.integer :parent
      t.references :navigation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
