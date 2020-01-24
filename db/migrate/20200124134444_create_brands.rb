class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :title
      t.string :phone
      t.string :email
      t.integer :logo
      t.string :facebook
      t.string :twitter
      t.string :linkedin

      t.timestamps
    end
  end
end
