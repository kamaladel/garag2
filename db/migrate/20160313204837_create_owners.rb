class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.text :name
      t.string :phone
      t.string :email
   	  t.integer :car_number
      t.string :car_type
      t.string :car_model
      t.integer :car_year
      t.date :car_next_service_date, default: 5.months.from_now
      t.integer :car_km
      t.timestamps null: false
    end
  end
end

