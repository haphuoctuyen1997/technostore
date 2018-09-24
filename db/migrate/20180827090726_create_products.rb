class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.float :promotion_price
      t.integer :quantity
      t.text :description
      t.string :picture
      t.string :os
      t.string :cpu
      t.string :ram
      t.string :card
      t.string :hard_driver
      t.string :weight
      t.string :screens
      t.string :pin
      t.string :other_features
      t.integer :number_of_order, default: 0
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
