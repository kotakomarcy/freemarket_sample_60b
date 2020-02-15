class RenameDeliveryAreaColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :delivery_area, :prefecture_id
  end
end
