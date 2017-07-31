require 'rails_helper'

describe "Flower Photos API" do
  attr_reader :flower_photo1, :flower_photo2, :flower_photo3
  
  before do
    @flower_photo1, @flower_photo2, @flower_photo3 = create_list(:flower_photo_with_favorites, 3)
  end
  
  it "/flower_photos provides name, plant family, photographer & url" do
    get '/api/v1/flower_photos'
  
    expect(response).to be_success
  
    flower_photos = JSON.parse(response.body)
    expect(flower_photos.count).to eq(3)
    expect(flower_photos.first).to have_key("assigned_name")
    expect(flower_photos.first).to have_key("storage_url")
    expect(flower_photos.first).to have_key("photographer")
    expect(flower_photos.first).to have_key("plant_family")
    expect(flower_photos.first['assigned_name']).to eq(flower_photo1.assigned_name)
    expect(flower_photos.first['storage_url']).to eq(flower_photo1.storage_url)
    expect(flower_photos.first['photographer']).to eq(flower_photo1.user.username)
    expect(flower_photos.first['plant_family']).to eq(flower_photo1.plant_family.taxonomic_name)
  end
  
  it "/flower_photos/find?common_family_name=Lily finds flower photos belonging to a family by common_name" do
    flower_photo1.update(plant_family_id: flower_photo2.plant_family.id)
    get "/api/v1/flower_photos/find?common_family_name=#{flower_photo2.plant_family.sanitized_common_name}"

    flower_photos = JSON.parse(response.body)
    expect(flower_photos.count).to eq(2)
    expect(flower_photos.first['plant_family']).to eq(flower_photo2.plant_family.taxonomic_name)
    expect(flower_photos.last['plant_family']).to eq(flower_photo2.plant_family.taxonomic_name)
  end
  
  it "/flower_photos/find?taxonomic_family_name=Lily finds flower photos belonging to a family by taxonomic_name" do
    get "/api/v1/flower_photos/find?taxonomic_family_name=#{flower_photo1.plant_family.sanitized_taxonomic_name}"

    flower_photos = JSON.parse(response.body)
    expect(flower_photos.count).to eq(1)
    expect(flower_photos.first['plant_family']).to eq(flower_photo1.plant_family.taxonomic_name)
  end

end
