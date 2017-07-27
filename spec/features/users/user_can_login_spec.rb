require "rails_helper"

feature "As an authenticated user" do
  scenario "user can login" do
    user = create(:user)
    visit "/"
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on "Log in"
    
    expect(current_path).to eq(users_favorite_flower_photos_path(user.username))
    expect(page).to have_content("Welcome again, plant friend!")
  end
  
  scenario "user gets a flash message with the wrong password" do
    user = create(:user)
    visit "/"
    fill_in 'user_email', with: "hi@hi.com"
    fill_in 'user_password', with: "123"
    click_on "Log in"
    
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Oops! Looks like that email's invalid. Please try again.")
  end
  
  scenario "user gets a flash message with the wrong password" do
    user = create(:user)
    visit "/"
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: "hi"
    click_on "Log in"
    
    expect(current_path).to eq(root_path)
    expect(page).to have_content("We think you entered the wrong password. Try again please!")
  end
  
end