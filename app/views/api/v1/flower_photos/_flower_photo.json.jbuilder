json.extract! flower_photo, :id, :assigned_name, :storage_url

json.photographer @flower_photo.user.username

json.habitat @flower_photo.habitat.name

json.location do
  json.address_number @flower_photo.location.address_number
  json.street_name @flower_photo.location.street_name
  json.city @flower_photo.location.city
  json.state @flower_photo.location.state
  json.country @flower_photo.location.country
end

json.plant_family do
  json.common_name @flower_photo.plant_family.common_name
  json.taxonomic_name @flower_photo.plant_family.taxonomic_name
end

json.favorites_count @flower_photo.favorites.count