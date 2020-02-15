class ChangeColumnToUserIdOfProduct < ActiveRecord::Migration[5.2]

  # def up
  #   change_column :products, :user, :reference, foreign_key: true, null: false
  # end

  def change
    remove_reference :products, :user, foreign_key: true
    add_reference :products, :user, foreign_key: true, null: false
  end
end
