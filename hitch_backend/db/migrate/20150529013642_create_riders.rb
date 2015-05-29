class CreateRiders < ActiveRecord::Migration
  def change
    create_table :riders do |t|
      t.integer :passenger_id
      t.integer :trip_id

      t.timestamps null: false
    end
  end
end
