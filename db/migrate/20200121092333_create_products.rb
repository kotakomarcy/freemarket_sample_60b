class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string   :name, null:false
      t.text     :description, null:false
      t.integer  :size
      t.integer  :condition, null:false
      t.integer  :delivery_charge, null:false
      t.integer  :delivery_way, null:false
      t.integer  :delivery_area, null:false
      t.integer  :delivery_days, null:false
      t.integer  :price, null:false
      t.integer  :status, null:false
      t.timestamps
    end
  end
end
