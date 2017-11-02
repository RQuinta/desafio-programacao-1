class CreatePurchasers < ActiveRecord::Migration[5.0]
  def change
    create_table :purchasers do |t|
      t.string :name

      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.datetime :deleted_at, null: false
    end
  end
end
