class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.integer :address_number
      t.text :street_name
      t.text :city
      t.text :state
      t.text :country

      t.timestamps
    end
  end
end
