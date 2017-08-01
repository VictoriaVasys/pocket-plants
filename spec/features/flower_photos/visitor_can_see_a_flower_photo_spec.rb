require 'rails_helper'

feature "An unauthenticated user", :js => :true do
  attr_reader :flower_photo
  
  before do
    @flower_photo = create(:flower_photo_with_the_works)
  end
  
  scenario "can view their favorite flower photos" do
    visit "/#{flower_photo.user.username}/#{flower_photo.sanitized_name}"
    
    within (".flower-photo-show") do
      expect(page).to have_content(flower_photo.assigned_name)
      expect(page).to have_content("#{flower_photo.plant_family.taxonomic_name} family")
      expect(page).to have_css("img[src*='#{flower_photo.storage_url}']")
      expect(page).to have_content("Photographer: #{flower_photo.user.username}")
      
      within('.flower-photo-favorites') do
        expect(page).to have_content("#{flower_photo.favorites.count}")
      end
      
      within('.gvision-descriptions') do
        expect(page).to have_content("#{flower_photo.gvision_descriptions.first.name}")
        expect(page).to have_content("#{flower_photo.gvision_descriptions.second.name}")
        expect(page).to have_content("#{flower_photo.gvision_descriptions.last.name}")
        
        within('.gvision-descriptions-favorites-count') do
          expect(page).to have_content("#{flower_photo.gvision_descriptions.first.favorites.count}")
          expect(page).to have_content("#{flower_photo.gvision_descriptions.second.favorites.count}")
          expect(page).to have_content("#{flower_photo.gvision_descriptions.last.favorites.count}")
        end
      end
      
      within('.comments') do
        expect(page).to have_content("#{flower_photo.comments.first.name}")
        expect(page).to have_content("#{flower_photo.comments.second.name}")
        expect(page).to have_content("#{flower_photo.comments.last.name}")
        
        within('.comments-favorites-count') do
          expect(page).to have_content("#{flower_photo.comments.first.favorites.count}")
          expect(page).to have_content("#{flower_photo.comments.second.favorites.count}")
          expect(page).to have_content("#{flower_photo.comments.last.favorites.count}")
        end
      end
    end
  end

end