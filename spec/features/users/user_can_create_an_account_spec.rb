require "rails_helper"

feature "As a visitor" do
  scenario "user can sign up" do
    visit "/"  
    click_on "Sign up here!"
    
    expect(current_path).to eq(sign_up_path)
    
    fill_in "user[email]", with: "vic@vasys.com"
    fill_in "user[username]", with: "vic"
    fill_in "user[password]", with: "123"
    fill_in "user[password_confirmation]", with: "123"
    click_on "Create your Account"
    
    expect(current_path).to eq(users_favorite_flower_photos_path("vic"))
    expect(page).to have_content("Wooohoo, you're an official pocket-planter! :D")
  end
  
  scenario "user doesn't enter a password" do
    visit "/"  
    click_on "Sign up here!"
    
    expect(current_path).to eq(sign_up_path)
    
    fill_in "user[email]", with: "vic@vasys.com"
    fill_in "user[username]", with: "vic"
    fill_in "user[password_confirmation]", with: "123"
    click_on "Create your Account"
    expect(current_path).to eq(sign_up_path)
    expect(page).to have_content("Couldn't create account; Password can't be blank")
  end
  
  scenario "user doesn't enter an email" do
    visit "/"  
    click_on "Sign up here!"
    
    expect(current_path).to eq(sign_up_path)
    
    fill_in "user[username]", with: "vic"
    fill_in "user[password]", with: "123"
    fill_in "user[password_confirmation]", with: "123"
    click_on "Create your Account"
    
    expect(current_path).to eq(sign_up_path)
    expect(page).to have_content("Couldn't create account; Email can't be blank")
  end
  
  scenario "user doesn't enter a username" do
    visit "/"  
    click_on "Sign up here!"
    
    expect(current_path).to eq(sign_up_path)
    
    fill_in "user[email]", with: "vic@vasys.com"
    fill_in "user[password]", with: "123"
    fill_in "user[password_confirmation]", with: "123"
    click_on "Create your Account"
    
    expect(current_path).to eq(sign_up_path)
    expect(page).to have_content("Couldn't create account; Username can't be blank")
  end
  
  scenario "user doesn't enter a password confirmation" do
    visit "/"  
    click_on "Sign up here!"
    
    expect(current_path).to eq(sign_up_path)
    
    fill_in "user[email]", with: "vic@vasys.com"
    fill_in "user[username]", with: "vic"
    fill_in "user[password]", with: "123"
    click_on "Create your Account"
    expect(current_path).to eq(sign_up_path)
    expect(page).to have_content("Couldn't create account; Password confirmation doesn't match Password")
  end
end


