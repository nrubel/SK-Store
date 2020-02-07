class CreateMediaItems < ActiveRecord::Migration[6.0]
  def change
    create_table :media_items do |t|
      t.timestamps
    end
  end
end
