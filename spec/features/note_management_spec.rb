require 'rails_helper'

RSpec.feature "Note Management", type: :feature do
  scenario "can create a new note and associate it to a new customer" do
    note = build(:note)
    customer = build(:customer)
    visit new_note_path
    fill_in "Call notes", with: note.content
    fill_in "Customer phone", with: customer.phone_number
    fill_in "Customer name", with: customer.name
    click_button "Create"
    expect(page).to have_content("Note was successfully created")
  end

  scenario "can create a new note and associate it to an existing customer" do
    note = build(:note)
    customer = create(:customer)
    customer_count = Customer.count
    visit new_note_path
    fill_in "Call notes", with: note.content
    fill_in "Customer phone", with: customer.phone_number
    fill_in "Customer name", with: customer.name
    click_button "Create"
    expect(page).to have_content("Note was successfully created")
    expect(Customer.count).to eq(customer_count)
  end

  scenario "can mark a note as done" do
    note = create(:note)
    visit edit_note_path(note)
    check "Done"
    click_button "Update"
    expect(page).to have_content("Note was successfully updated")
    expect(Note.last.done?).to eq(true)
  end
end
