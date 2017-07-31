require 'rails_helper'

describe 'flower photo gvision descriptions' do
  attr_reader :flower_photo, :gvision_description_one
  
  before do
    @flower_photo = create(:flower_photo_with_gvision_descriptions)
    @gvision_description_one = flower_photo.gvision_descriptions.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(flower_photo.user)
  end
  
  # it "can return all gvision descriptions" do
  #   get "/api/v1/users/flower_photos/gvision_descriptions"
  # 
  #   expect(response).to have_http_status(200)
  # 
  #   gvision_descriptions = JSON.parse(response.body)
  # 
  #   expect(gvision_descriptions).to be_an(Array)
  #   expect(gvision_descriptions.count).to eq(3)
  #   expect(gvision_descriptions.first["id"]).to eq(gvision_description_one.id)
  #   expect(gvision_descriptions.first["name"]).to eq(gvision_description_one.name)
  #   expect(gvision_descriptions.first["created_at"]).not_to be_present
  #   expect(gvision_descriptions.first["updated_at"]).not_to be_present
  # end

  # it "can return one gvision_description" do        
  #   get "/api/v1/users/flower_photos/gvision_descriptions/#{gvision_description_one.id}"
  #   
  #   expect(response).to have_http_status(200)
  # 
  #   gvision_description = JSON.parse(response.body)
  # 
  #   expect(gvision_description).to be_a(Hash)
  #   expect(gvision_description["id"]).to eq(gvision_description_one.id)
  #   expect(gvision_description["name"]).to eq(gvision_description_one.name)
  #   expect(gvision_description["created_at"]).not_to be_present
  #   expect(gvision_description["updated_at"]).not_to be_present
  # end
  
  it "can create new gvision_description" do
    post "/api/v1/users/flower_photos/#{flower_photo.id}/gvision_descriptions?name=California%20Poppy"
  
    expect(response).to have_http_status(201)
  
    gvision_description = JSON.parse(response.body)
  
    expect(gvision_description).to be_a(Hash)
    expect(gvision_description["name"]).to eq("California Poppy")
    expect(gvision_description["created_at"]).not_to be_present
    expect(gvision_description["updated_at"]).not_to be_present
  end
  
  # it "can update a gvision_description" do
  #   patch "/api/v1/#{flower_photo.user.username}/#{flower_photo.sanitized_name}/gvision_descriptions/#{gvision_description_one.id}?name=red"
  # 
  #   expect(response).to have_http_status(200)
  # 
  #   gvision_description = JSON.parse(response.body)
  # 
  #   expect(gvision_description).to be_a(Hash)
  #   expect(gvision_description["name"]).to eq("red")
  #   expect(gvision_description["created_at"]).not_to be_present
  #   expect(gvision_description["updated_at"]).not_to be_present
  # end
  
  it "can delete exisiting gvision_description" do
    expect(flower_photo.gvision_descriptions.count).to eq(3)
    
    delete "/api/v1/users/flower_photos/#{flower_photo.id}/gvision_descriptions/#{gvision_description_one.id}"
  
    expect(response).to have_http_status(204)
  
    expect(flower_photo.gvision_descriptions.count).to eq(2)
  end
end