class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.references :price, foreign_key: true
      t.belongs_to :cart
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end