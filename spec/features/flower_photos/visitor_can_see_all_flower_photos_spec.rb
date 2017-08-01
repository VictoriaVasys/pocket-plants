require 'rails_helper'

feature "An unauthenticated user", :js => :true do
  attr_reader :flower_photo
  
  before do
    create_list(:flower_photo, 3)
    @flower_photo = FlowerPhoto.first
  end
  
  scenario "can view their favorite flower photos" do
    visit "/flower_photos"
    
    expect(page).to have_selector(".flower-photo", count: 3) 
    within first(".flower-photo") do
      expect(page).to have_content(flower_photo.assigned_name)
      expect(page).to have_content("#{flower_photo.plant_family.taxonomic_name}")
      expect(page).to have_css("img[src*='#{flower_photo.storage_url}']")
      expect(page).to have_content("Photographer: #{flower_photo.user.username}")
    end
  end

end