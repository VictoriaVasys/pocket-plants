require 'rails_helper'

describe 'flower photo favorites' do
  attr_reader :flower_photo, :favorite_1
  
  before do
    @flower_photo = create(:flower_photo_with_favorites)
    @favorite_1 = flower_photo.favorites.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(flower_photo.user)
  end
  
  it "can create new favorite" do
    post "/api/v1/users/flower_photos/#{flower_photo.id}/gvision_descriptions/#{flower_photo.id}/favorites?favorite=true"
  
    expect(response).to have_http_status(201)
  
    favorite = JSON.parse(response.body)
  
    expect(favorite).to be_a(Hash)
    expect(favorite["favorites_count"]).to eq(4)
    expect(favorite["created_at"]).not_to be_present
    expect(favorite["updated_at"]).not_to be_present
  end
  
  it "can delete exisiting favorite" do
    expect(flower_photo.favorites.count).to eq(3)
    
    delete "/api/v1/users/flower_photos/#{flower_photo.id}/gvision_descriptions/#{flower_photo.id}/favorites/#{favorite_1.id}"
    
    favorite = JSON.parse(response.body)
    
    expect(response).to have_http_status(202)
    expect(favorite["favorites_count"]).to eq(2)
    expect(flower_photo.favorites.count).to eq(2)
  end
end