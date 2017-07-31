class CreatePlantFamilies < ActiveRecord::Migration[5.0]
  def change
    create_table :plant_families do |t|
      t.text :common_name
      t.text :taxonomic_name

      t.timestamps
    end
  end
end
