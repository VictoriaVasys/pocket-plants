json.extract! flower_photo, :id, :assigned_name, :storage_url

json.photographer flower_photo.user.username

json.plant_family do
  json.common_name flower_photo.plant_family.common_name
  json.taxonomic_name flower_photo.plant_family.taxonomic_name
end

json.favorites_count flower_photo.favorites.count