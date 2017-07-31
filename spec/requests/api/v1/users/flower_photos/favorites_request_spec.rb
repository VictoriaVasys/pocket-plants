require 'rails_helper'

describe 'flower photo favorites' do
  attr_reader :flower_photo, :favorite_1
  
  before do
    @flower_photo = create(:flower_photo_with_favorites)
    @favorite_1 = flower_photo.favorites.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(flower_photo.user)
  end
  
  it "can create new favorite" do
    post "/api/v1/users/flower_photos/#{flower_photo.id}/favorites"
  
    expect(response).to have_http_status(201)
  
    favorite = JSON.parse(response.body)
  
    expect(favorite).to be_a(Hash)
    expect(favorite["favorites_count"]).to eq(4)
    expect(favorite["created_at"]).not_to be_present
    expect(favorite["updated_at"]).not_to be_present
  end
  
  it "returns all favorites" do
    @flower_photo_2 = create(:flower_photo)
    @flower_photo_2.favorites.create(
      favorable_id: flower_photo.id, 
      favorable_type: "FlowerPhoto", 
      user_id: flower_photo.user.id
    )
    get "/#{flower_photo.user.username}/favorite_flower_photos"
  
    expect(response).to have_http_status(201)
  
    favorites = JSON.parse(response.body)
  
    expect(favorites).to be_an(Array)
    expect(favorites.count).to eq(2)
    expect(favorites.first["assigned_name"]).to eq(flower_photo.assigned_name)
    expect(favorites.first["created_at"]).not_to be_present
    expect(favorites.first["updated_at"]).not_to be_present
  end
  
  it "can delete exisiting favorite" do
    expect(flower_photo.favorites.count).to eq(3)
    
    delete "/api/v1/users/flower_photos/#{flower_photo.id}/favorites/#{favorite_1.id}"
    
    favorite = JSON.parse(response.body)
    
    expect(response).to have_http_status(202)
    expect(favorite["favorites_count"]).to eq(2)
    expect(flower_photo.favorites.count).to eq(2)
  end
end