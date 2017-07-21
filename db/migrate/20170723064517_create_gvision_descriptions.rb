class CreateGvisionDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :gvision_descriptions do |t|
      t.text :name
      t.references :flower_photo, foreign_key: true

      t.timestamps
    end
  end
end
