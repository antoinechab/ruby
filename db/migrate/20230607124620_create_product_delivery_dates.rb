class CreateProductDeliveryDates < ActiveRecord::Migration[7.0]
  def change
    create_table :product_delivery_dates do |t|
      t.date :deliveryDate
      t.boolean :archive, default: false

      t.timestamps
    end
  end
end
