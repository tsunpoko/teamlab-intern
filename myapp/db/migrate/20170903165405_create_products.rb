class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :shop, index: true, foreign_key: true
      t.string :title, limit: 100
      t.text :description, limit: 500
      t.integer :price
      t.binary :image

      t.timestamps
    end
  end
end
