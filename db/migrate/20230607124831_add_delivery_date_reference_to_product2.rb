class AddDeliveryDateReferenceToProduct2 < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :product_delivery_date, foreign_key: true, null: true
  end
end
