class CreateHabitats < ActiveRecord::Migration[5.0]
  def change
    create_table :habitats do |t|
      t.text :name

      t.timestamps
    end
  end
end
