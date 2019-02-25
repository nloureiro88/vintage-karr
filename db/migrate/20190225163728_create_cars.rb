class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.references :owner, index: true, foreign_key: { to_table: :users }
      t.string :brand
      t.string :model
      t.string :car_type
      t.string :fuel_type
      t.text :description
      t.string :car_photo
      t.integer :year
      t.integer :mileage
      t.boolean :for_rental, default: true
      t.float :price
      t.date :date_start
      t.date :date_end

      t.timestamps
    end
  end
end
