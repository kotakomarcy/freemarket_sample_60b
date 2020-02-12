class RenameBirhtMonthColumToUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :birht_month, :birth_month
    rename_column :users, :profile_tetx, :profile_text
  end
end
