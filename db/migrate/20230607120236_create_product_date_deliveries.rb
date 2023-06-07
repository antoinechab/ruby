class CreateProductDateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :product_date_deliveries do |t|
      t.date :deliveryDate
      t.boolean :archive, default: false

      t.timestamps
    end
  end
end
