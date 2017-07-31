require 'rails_helper'

describe 'flower photo favorites' do
  attr_reader :flower_photo, :favorite_1
  
  before do
    @flower_photo = create(:flower_photo_with_favorites)
    @favorite_1 = flower_photo.favorites.first
  end
  
  it "can create new favorite" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(flower_photo.user)
    
    post "/api/v1/users/flower_photos/#{flower_photo.id}/favorites"
  
    expect(response).to have_http_status(201)
  
    favorite = JSON.parse(response.body)
  
    expect(favorite).to be_a(Hash)
    expect(favorite["favorites_count"]).to eq(4)
    expect(favorite["created_at"]).not_to be_present
    expect(favorite["updated_at"]).not_to be_present
  end
  
  it "returns all favorites" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(favorite_1.user)
    flower_photo_2 = create(:flower_photo)
    flower_photo_2.favorites.create(
      favorable_id: flower_photo.id, 
      favorable_type: "FlowerPhoto", 
      user_id: favorite_1.user.id
    )
    get "/api/v1/users/#{favorite_1.user.id}/favorite_flower_photos"
  
    flower_photos = JSON.parse(response.body)
    
    expect(flower_photos).to be_an(Array)
    expect(flower_photos.count).to eq(2)
    expect(flower_photos.first).to have_key("assigned_name")
    expect(flower_photos.first).to have_key("storage_url")
    expect(flower_photos.first).to have_key("photographer")
    expect(flower_photos.first).to have_key("plant_family")
    expect(flower_photos.first['assigned_name']).to eq(flower_photo.assigned_name)
    expect(flower_photos.first['storage_url']).to eq(flower_photo.storage_url)
    expect(flower_photos.first['photographer']).to eq(flower_photo.user.username)
    expect(flower_photos.first['plant_family']).to eq(flower_photo.plant_family.taxonomic_name)
  end
  
  it "can delete exisiting favorite" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(flower_photo.user)
    expect(flower_photo.favorites.count).to eq(3)
    
    delete "/api/v1/users/flower_photos/#{flower_photo.id}/favorites/#{favorite_1.id}"
    
    favorite = JSON.parse(response.body)
    
    expect(response).to have_http_status(202)
    expect(favorite["favorites_count"]).to eq(2)
    expect(flower_photo.favorites.count).to eq(2)
  end
end