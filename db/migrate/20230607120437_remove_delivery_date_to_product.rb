class RemoveDeliveryDateToProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :deliveryDate
  end
end
