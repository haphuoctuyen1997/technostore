class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :post_id
      t.integer :product_id
      t.string :photo
      t.text :description

      t.timestamps
    end
  end
end
