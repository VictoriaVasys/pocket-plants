json.extract! flower_photo, :id, :assigned_name, :storage_url

json.photographer flower_photo.user.username

json.plant_family flower_photo.plant_family.taxonomic_name

json.favorites_count flower_photo.favorites.count