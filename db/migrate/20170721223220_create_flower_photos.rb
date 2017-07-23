class CreateFlowerPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :flower_photos do |t|
      t.text :assigned_name
      t.text :storage_url
      t.references :plant_family, foreign_key: true
      t.references :user, foreign_key: true
      t.references :location, foreign_key: true
      t.references :habitat, foreign_key: true

      t.timestamps
    end
  end
end
