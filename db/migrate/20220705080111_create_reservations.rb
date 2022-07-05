class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :guest, null: false, foreign_key: true
      t.string :code
      t.date :start_date
      t.date :end_date
      t.integer :nights
      t.integer :guests
      t.integer :adults
      t.integer :children
      t.integer :infants
      t.string :status

      t.timestamps
    end

    add_index :reservations, :status
    add_index :reservations, :code, unique: true
  end
end
