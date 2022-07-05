class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.belongs_to :reservation, null: false, foreign_key: true
      t.string :currency
      t.integer :payment_price_cents
      t.integer :security_price_cents
      t.integer :total_price_cents

      t.timestamps
    end
  end
end
