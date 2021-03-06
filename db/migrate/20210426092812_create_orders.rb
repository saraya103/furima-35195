class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string     :postal_number, null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :address,       null: false
      t.string     :building
      t.string     :tel,           null: false
      t.references :order_log,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
