class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :booking, foreign_key: true
      t.integer :rt_fun
      t.integer :rt_condition
      t.integer :rt_performance
      t.integer :rt_owner

      t.timestamps
    end
  end
end
