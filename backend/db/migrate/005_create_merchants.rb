class CreateMerchants < ActiveRecord::Migration[5.0]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :address

      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.datetime :deleted_at, null: false
    end
  end
end
