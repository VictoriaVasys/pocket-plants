require 'rails_helper'

feature "An authenticated user", :js => :true do
  attr_reader :flower_photo, :user_with_favorites
  
  before do
    @flower_photo = create(:flower_photo_with_favorites)
    @user_with_favorites = flower_photo.favorites.first.user
    flower_photo_2 = create(:flower_photo)
    flower_photo_2.favorites.create(
      favorable_id: flower_photo.id, 
      favorable_type: "FlowerPhoto", 
      user_id: user_with_favorites.id
    )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_with_favorites)
  end
  
  scenario "can view their favorite flower photos" do
    visit "/#{user_with_favorites.username}/favorite_flower_photos"
    
    expect(page).to have_selector(".flower-photo", count: 2) 
    within first(".flower-photo") do
      expect(page).to have_content(flower_photo.assigned_name)
      expect(page).to have_content("Plant Family: #{flower_photo.plant_family.taxonomic_name}")
      expect(page).to have_css("img[src*='#{flower_photo.storage_url}']")
      expect(page).to have_content("Photographer: #{flower_photo.user.username}")
    end
  end

end