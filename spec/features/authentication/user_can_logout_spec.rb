require "rails_helper"

feature "As an authenticated user" do
  scenario "user can logout" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit "/"
    click_on "Log out"
    
    expect(current_path).to eq(root_path)
    expect(page).to have_content("You're all logged out. See you again soon :)")
  end
end