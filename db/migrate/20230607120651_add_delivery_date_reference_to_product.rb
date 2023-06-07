class AddDeliveryDateReferenceToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :product_date_delivery, foreign_key: true, null: true
  end
end
