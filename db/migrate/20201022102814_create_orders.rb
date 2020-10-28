class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string      :postal_code,    null: false
      t.integer     :prefecture_id,  null: false
      t.string      :municipality,   null: false
      t.string      :addres,         null: false
      t.string      :building_name
      t.string      :tell,           null: false
      t.references  :order_user

      t.timestamps
    end
  end
end