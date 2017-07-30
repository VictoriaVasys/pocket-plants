require 'rails_helper'

describe "Flower Photos API" do
  attr_reader :flower_photo1, :flower_photo2, :flower_photo3
  
  before do
    @flower_photo1, @flower_photo2, @flower_photo3 = create_list(:flower_photo_with_favorites, 3)
  end
  
  it "/flower_photos provides plant families & attributes" do
    get '/api/v1/flower_photos'
  
    expect(response).to be_success
  
    flower_photos = JSON.parse(response.body)
    expect(flower_photos.count).to eq(3)
    expect(flower_photos.first).to have_key("assigned_name")
    expect(flower_photos.first).to have_key("storage_url")
    expect(flower_photos.first).to have_key("photographer")
    expect(flower_photos.first['assigned_name']).to eq(flower_photo1.assigned_name)
    expect(flower_photos.first['storage_url']).to eq(flower_photo1.storage_url)
    expect(flower_photos.first['photographer']).to eq(flower_photo1.user.username)
  end
  
  it "/flower_photos/:id provides attributes and relationships based on id" do
    get "/api/v1/flower_photos/#{flower_photo2.id}"
    flower_photo = JSON.parse(response.body)
  
    expect(flower_photo).to have_key("assigned_name")
    expect(flower_photo).to have_key("storage_url")
    expect(flower_photo).to have_key("photographer")
    expect(flower_photo).to have_key("habitat")
    expect(flower_photo).to have_key("location")
    expect(flower_photo).to have_key("plant_family")
    expect(flower_photo).to have_key("favorites_count")
    expect(flower_photo['assigned_name']).to eq(flower_photo2.assigned_name)
    expect(flower_photo['storage_url']).to eq(flower_photo2.storage_url)
    expect(flower_photo['photographer']).to eq(flower_photo2.user.username)
    expect(flower_photo['habitat']).to eq(flower_photo2.habitat.name)
    expect(flower_photo['favorites_count']).to eq(3)
    expect(flower_photo['location']).to have_key("city")
    expect(flower_photo['location']).to have_key("country")
    expect(flower_photo['location']).to have_key("address_number")
    expect(flower_photo['location']).to have_key("street_name")
    expect(flower_photo['location']).to have_key("state")
    expect(flower_photo['plant_family']).to have_key("common_name")
    expect(flower_photo['plant_family']).to have_key("taxonomic_name")
    expect(flower_photo['location']['city']).to eq(flower_photo2.location.city)
    expect(flower_photo['location']['country']).to eq(flower_photo2.location.country)
    expect(flower_photo['plant_family']['common_name']).to eq(flower_photo2.plant_family.common_name)
    expect(flower_photo['plant_family']['taxonomic_name']).to eq(flower_photo2.plant_family.taxonomic_name)
  end
  
  it "/flower_photos/find?assigned_name=<name> finds a plant photo by its assigned name" do
    get "/api/v1/flower_photos/find?assigned_name=#{flower_photo2.assigned_name}"

    flower_photo = JSON.parse(response.body)
    expect(flower_photo['assigned_name']).to eq(flower_photo2.assigned_name)
    expect(flower_photo['storage_url']).to eq(flower_photo2.storage_url)
    expect(flower_photo['favorites_count']).to eq(3)
    expect(flower_photo['photographer']).to eq(flower_photo2.user.username)
    expect(flower_photo['habitat']).to eq(flower_photo2.habitat.name)
    expect(flower_photo['location']['city']).to eq(flower_photo2.location.city)
    expect(flower_photo['location']['country']).to eq(flower_photo2.location.country)
    expect(flower_photo['plant_family']['common_name']).to eq(flower_photo2.plant_family.common_name)
    expect(flower_photo['plant_family']['taxonomic_name']).to eq(flower_photo2.plant_family.taxonomic_name)
  end

end
