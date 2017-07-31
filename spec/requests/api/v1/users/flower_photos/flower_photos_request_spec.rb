require 'rails_helper'

describe "User/Flower Photos API" do
  attr_reader :flower_photo1
  
  before do
    @flower_photo1 = create(:flower_photo_with_favorites)
  end
  
  it "api/v1/users/:user_id/flower_photos/:flower_photo_id provides attributes and relationships based on id" do
    get "/api/v1/users/flower_photos/#{flower_photo1.id}"
    
    flower_photo = JSON.parse(response.body)
  
    expect(flower_photo).to have_key("assigned_name")
    expect(flower_photo).to have_key("storage_url")
    expect(flower_photo).to have_key("photographer")
    expect(flower_photo).to have_key("plant_family")
    expect(flower_photo).to have_key("favorites_count")
    expect(flower_photo['assigned_name']).to eq(flower_photo1.assigned_name)
    expect(flower_photo['storage_url']).to eq(flower_photo1.storage_url)
    expect(flower_photo['photographer']).to eq(flower_photo1.user.username)
    expect(flower_photo['favorites_count']).to eq(3)
    expect(flower_photo['plant_family']).to have_key("common_name")
    expect(flower_photo['plant_family']).to have_key("taxonomic_name")
    expect(flower_photo['plant_family']['common_name']).to eq(flower_photo1.plant_family.common_name)
    expect(flower_photo['plant_family']['taxonomic_name']).to eq(flower_photo1.plant_family.taxonomic_name)
  end
  
  it "/:username/:flower_photos/find?assigned_name=<name> finds a plant photo by its assigned name" do
    get "/api/v1/users/flower_photos/find?assigned_name=#{flower_photo1.sanitized_name}"

    flower_photo = JSON.parse(response.body)
    
    expect(flower_photo['assigned_name']).to eq(flower_photo1.assigned_name)
    expect(flower_photo['storage_url']).to eq(flower_photo1.storage_url)
    expect(flower_photo['favorites_count']).to eq(3)
    expect(flower_photo['photographer']).to eq(flower_photo1.user.username)
    expect(flower_photo['plant_family']['common_name']).to eq(flower_photo1.plant_family.common_name)
    expect(flower_photo['plant_family']['taxonomic_name']).to eq(flower_photo1.plant_family.taxonomic_name)
  end

end
