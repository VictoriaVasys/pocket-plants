require 'rails_helper'

describe 'flower photo gvision descriptions' do
  attr_reader :flower_photo, :gvision_description_one
  
  before do
    @flower_photo = create(:flower_photo_with_gvision_descriptions)
    @gvision_description_one = flower_photo.gvision_descriptions.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(flower_photo.user)
  end
  
  it "can create new gvision_description" do
    post "/api/v1/users/flower_photos/#{flower_photo.id}/gvision_descriptions?name=California%20Poppy"
  
    expect(response).to have_http_status(201)
  
    gvision_description = JSON.parse(response.body)
  
    expect(gvision_description).to be_a(Hash)
    expect(gvision_description["name"]).to eq("California Poppy")
    expect(gvision_description["created_at"]).not_to be_present
    expect(gvision_description["updated_at"]).not_to be_present
  end
  
  it "can delete exisiting gvision_description" do
    expect(flower_photo.gvision_descriptions.count).to eq(3)
    
    delete "/api/v1/users/flower_photos/#{flower_photo.id}/gvision_descriptions/#{gvision_description_one.id}"
  
    expect(response).to have_http_status(204)
  
    expect(flower_photo.gvision_descriptions.count).to eq(2)
  end
end