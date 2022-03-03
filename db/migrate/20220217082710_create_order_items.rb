class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.decimal :item_price
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
    end
  end
end
