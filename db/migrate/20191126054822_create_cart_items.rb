class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :item, index: true
      t.references :cart, index: true
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end
