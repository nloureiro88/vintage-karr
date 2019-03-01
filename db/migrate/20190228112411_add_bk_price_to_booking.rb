class AddBkPriceToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :bk_price, :float
  end
end
