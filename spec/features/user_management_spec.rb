require 'rails_helper'

RSpec.feature "User Management", type: :feature do
  scenario "can create a new user" do
    visit new_user_path
    fill_in "First name", with: FFaker::Name.first_name
    fill_in "Last name", with: FFaker::Name.last_name
    fill_in "Email", with: FFaker::Internet.email
    click_button "Create"
    expect(page).to have_content("User was successfully created")
  end

  scenario "can update a user" do
    user = create(:user)
    visit edit_user_path(user)
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Email", with: user.email
    click_button "Update"
    expect(page).to have_content("User was successfully updated")
    expect(User.last.first_name).to eq(user.first_name)
    expect(User.last.last_name).to eq(user.last_name)
    expect(User.last.email).to eq(user.email)
  end
end
