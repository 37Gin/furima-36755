class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :postcode,        null: false
      t.integer :region_id,      null: false
      t.string :city,            null: false
      t.string :address,         null: false
      t.string :building_name
      t.string :phone_number,    null: false
      t.references :log,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
