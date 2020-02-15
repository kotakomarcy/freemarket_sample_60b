class ChangeColumnToProduct < ActiveRecord::Migration[5.2]
  
  def up
    change_column :products, :status, :integer, null: false, default: 0
  end

  def down
    change_column :products, :status, :integer, null: false
  end
end
