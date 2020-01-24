class CreateNavigations < ActiveRecord::Migration[6.0]
  def change
    create_table :navigations do |t|
      t.string :name

      t.timestamps
    end
    add_index :navigations, :name, unique: true
  end
end
