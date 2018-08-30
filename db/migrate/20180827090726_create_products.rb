class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.integer :quantity
      t.text :description
      t.string :picture
      t.integer :number_of_order, default: 0
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
