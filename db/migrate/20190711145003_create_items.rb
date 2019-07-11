class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :image
      t.string :item
      t.text :note
      t.integer :price

      t.timestamps
    end
  end
end
