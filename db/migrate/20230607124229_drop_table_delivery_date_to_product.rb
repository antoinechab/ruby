class DropTableDeliveryDateToProduct < ActiveRecord::Migration[7.0]
  def change
    remove_reference :products, :product_date_delivery, index: true, foreign_key: true
    drop_table :product_date_deliveries
  end
end
