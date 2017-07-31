require 'rails_helper'

feature "An authenticated user", :js => :true do
  attr_reader :flower_photo
  
  before do
    @flower_photo = create(:flower_photo_with_favorites)
    @flower_photo_2 = create(:flower_photo)
    @flower_photo_2.favorites.create(
      favorable_id: flower_photo.id, 
      favorable_type: "FlowerPhoto", 
      user_id: flower_photo.user.id
    )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(flower_photo.user)
  end
  
  scenario "can view their favorite flower photos" do
    visit "/#{flower_photo.user.username}/favorite_flower_photos"
    
    expect(page).to have_selector(".flower_photo", count: 2) 
    within first(".flower_photo") do
      expect(page).to have_content(flower_photo.assigned_name)
      expect(page).to have_css(flower_photo.storage_url)
      expect(page).to have_content("Photographer: #{flower_photo.user.username}")
    end
  end
  
  skip context "submits a link" do
    scenario "the link should appear at the top of the page & maintain order" do
      user = create(:user_with_links)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit links_path
      within first("form") do
        fill_in 'link_title', with: "Turing"
        fill_in 'link_url', with: "https://turing.io"
        click_on "Add your link!"
      end
      
      within first('.link') do
        expect(page).to have_content("Title: Turing")
        expect(page).to have_content("URL: https://turing.io")
        expect(page).to have_content("Read? false")
      end
      
      visit links_path
      
      within first('.link') do
        expect(page).to have_content("Title: Turing")
        expect(page).to have_content("URL: https://turing.io")
        expect(page).to have_content("Read? false")
      end
    end
  end

end