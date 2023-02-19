require 'rails_helper'

RSpec.feature "User Management", type: :feature do
  scenario "can create a new user" do
    visit new_user_path
    fill_in "Name", with: FFaker::Name.name
    fill_in "Email", with: FFaker::Internet.email
    click_button "Create"
    expect(page).to have_content("User was successfully created")
  end

  scenario "can update a user" do
    user = create(:user)
    visit edit_user_path(user)
    fill_in "Name", with: user.name
    fill_in "Email", with: user.email
    click_button "Update"
    expect(page).to have_content("User was successfully updated")
    expect(User.last.name).to eq(user.name)
    expect(User.last.email).to eq(user.email)
  end
end
