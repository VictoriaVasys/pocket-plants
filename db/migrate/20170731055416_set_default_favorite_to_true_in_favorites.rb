class SetDefaultFavoriteToTrueInFavorites < ActiveRecord::Migration[5.0]
  def change
    change_column :favorites, :favorite, :boolean, default: true
  end
end
