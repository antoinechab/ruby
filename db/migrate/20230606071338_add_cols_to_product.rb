class AddColsToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :deliveryDate, :date
    add_column :products, :onSite, :boolean, default: true
    add_column :products, :stat, :string, default: "neuf"
  end
end
