class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string :name, null: false, limit: 255

      t.timestamps null: false
    end
  end
end
