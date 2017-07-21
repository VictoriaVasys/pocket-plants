class CreatePlantFamilyHabitats < ActiveRecord::Migration[5.0]
  def change
    create_table :plant_family_habitats do |t|
      t.references :habitat, foreign_key: true
      t.references :plant_family, foreign_key: true

      t.timestamps
    end
  end
end
