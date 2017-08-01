require 'rails_helper'

feature "An unauthenticated user", :js => :true do
  attr_reader :flower_photo
  
  before do
    @flower_photo = create(:flower_photo_with_the_works)
  end
  
  scenario "can view their favorite flower photos" do
    visit "/#{flower_photo.user.username}/#{flower_photo.sanitized_name}"
    
    expect(page).to have_content(flower_photo.assigned_name)
    within (".flower-photo-show") do
      expect(page).to have_content("#{flower_photo.plant_family.taxonomic_name}")
      expect(page).to have_css("img[src*='#{flower_photo.storage_url}']")
      expect(page).to have_content("Photographer: #{flower_photo.user.username}")
    end
      
    within('.gvision-descriptions') do
      expect(page).to have_content("#{flower_photo.gvision_descriptions.first.name}")
      expect(page).to have_content("#{flower_photo.gvision_descriptions.second.name}")
      expect(page).to have_content("#{flower_photo.gvision_descriptions.last.name}")
    end
    
    within('.comments') do
      expect(page).to have_content("#{flower_photo.comments.first.user.username}")
      expect(page).to have_content("#{flower_photo.comments.first.body}")
      expect(page).to have_content("#{flower_photo.comments.second.user.username}")
      expect(page).to have_content("#{flower_photo.comments.second.body}")
      expect(page).to have_content("#{flower_photo.comments.last.user.username}")
      expect(page).to have_content("#{flower_photo.comments.last.body}")
    end
  end

end