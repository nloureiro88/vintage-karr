class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :car, foreign_key: true
      t.references :driver, index: true, foreign_key: { to_table: :users }
      t.string :purpose
      t.string :status, default: "created"
      t.date :bk_start
      t.date :bk_end

      t.timestamps
    end
  end
end
