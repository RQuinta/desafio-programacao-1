class CreateSells < ActiveRecord::Migration[5.0]
  def change
    create_table :sells do |t|
      t.integer :count
      t.integer :item_id
      t.integer :purchaser_id
      t.integer :merchant_id
      t.string  :uuid

      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.datetime :deleted_at
    end
  end
end
