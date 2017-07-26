json.array!(@flower_photos) do |flower_photo| 
  json.id flower_photo.id
  json.assigned_name flower_photo.assigned_name 
  json.storage_url flower_photo.storage_url
  json.photographer flower_photo.user.username
end

