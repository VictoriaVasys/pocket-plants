require 'rails_helper'

describe 'flower photo comments' do
  attr_reader :flower_photo, :comment_1
  
  before do
    @flower_photo = create(:flower_photo_with_comments)
    @comment_1 = flower_photo.comments.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(flower_photo.user)
  end
  
  it "can return all comments" do
    get "/api/v1/users/flower_photos/#{flower_photo.id}/comments"
  
    expect(response).to have_http_status(200)
  
    comments = JSON.parse(response.body)
    expect(comments).to be_an(Array)
    expect(comments.count).to eq(3)
    expect(comments.last["id"]).to eq(comment_1.id)
    expect(comments.last["body"]).to eq(comment_1.body)
    expect(comments.last["created_at"]).not_to be_present
    expect(comments.last["updated_at"]).not_to be_present
  end

  it "can return one comment" do        
    get "/api/v1/users/flower_photos/#{flower_photo.id}/comments/#{comment_1.id}"
    
    expect(response).to have_http_status(200)
  
    comment = JSON.parse(response.body)
  
    expect(comment).to be_a(Hash)
    expect(comment["id"]).to eq(comment_1.id)
    expect(comment["body"]).to eq(comment_1.body)
    expect(comment["created_at"]).not_to be_present
    expect(comment["updated_at"]).not_to be_present
  end
  
  it "can create new comment" do
    post "/api/v1/users/flower_photos/#{flower_photo.id}/comments?body=That%20might%20be%20Cali%20Poppy"
    
    expect(response).to have_http_status(201)
  
    comment = JSON.parse(response.body)
  
    expect(comment).to be_a(Hash)
    expect(comment["body"]).to eq("That might be Cali Poppy")
    expect(comment["created_at"]).not_to be_present
    expect(comment["updated_at"]).not_to be_present
  end
  
  it "can update a comment" do
    patch "/api/v1/users/flower_photos/#{flower_photo.id}/comments/#{comment_1.id}?body=love"
  
    expect(response).to have_http_status(200)
  
    comment = JSON.parse(response.body)
  
    expect(comment).to be_a(Hash)
    expect(comment["body"]).to eq("love")
    expect(comment["created_at"]).not_to be_present
    expect(comment["updated_at"]).not_to be_present
  end
  
  it "can delete exisiting comment" do
    expect(flower_photo.comments.count).to eq(3)
    
    delete "/api/v1/users/flower_photos/#{flower_photo.id}/comments/#{comment_1.id}"
  
    expect(response).to have_http_status(204)
  
    expect(flower_photo.comments.count).to eq(2)
  end
end