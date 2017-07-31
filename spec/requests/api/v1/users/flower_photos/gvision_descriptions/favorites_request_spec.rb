require 'rails_helper'

describe 'flower photo favorites' do
  attr_reader :flower_photo, :gvision_description_1, :favorite_1
  
  before do
    @flower_photo = create(:flower_photo_with_gvision_descriptions)
    @gvision_description_1 = flower_photo.gvision_descriptions.first
    @favorite_1 = gvision_description_1.favorites.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(flower_photo.user)
  end
  
  it "can create new favorite" do
    post "/api/v1/users/flower_photos/#{flower_photo.id}/gvision_descriptions/#{gvision_description_1.id}/favorites"
  
    expect(response).to have_http_status(201)
  
    favorite_message = JSON.parse(response.body)
  
    expect(favorite_message).to be_a(Hash)
    expect(favorite_message["favorites_count"]).to eq(4)
    expect(favorite_message["created_at"]).not_to be_present
    expect(favorite_message["updated_at"]).not_to be_present
  end
  
  it "can delete exisiting favorite" do
    expect(gvision_description_1.favorites.count).to eq(3)
    
    delete "/api/v1/users/flower_photos/#{flower_photo.id}/gvision_descriptions/#{gvision_description_1.id}/favorites/#{favorite_1.id}"
    
    favorite_message = JSON.parse(response.body)
    
    expect(response).to have_http_status(202)
    expect(favorite_message["favorites_count"]).to eq(2)
    expect(gvision_description_1.favorites.count).to eq(2)
  end
end