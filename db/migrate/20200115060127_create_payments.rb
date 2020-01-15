class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :customer_id
      t.string :card_id
      t.string :token
      t.references :user, null:false, foreign_key:true
      t.timestamps 
    end
  end
end
