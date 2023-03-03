require 'rails_helper'

RSpec.feature "Note Management", type: :feature do
  scenario "can create a new note and associate it to a new customer" do
    note = build(:note)
    customer = build(:customer)
    customer_count = Customer.count
    sign_in
    visit new_note_path
    fill_in "Name", with: customer.name
    fill_in "Phone number", with: customer.phone_number
    fill_in "Call notes", with: note.content
    click_button "Create"
    expect(page).to have_content("Note was successfully created")
    expect(Note.first.customer.phone_number).to eq(customer.phone_number)
  end

  scenario "can create a new note and associate it to an existing customer" do
    note = build(:note)
    customer = create(:customer)
    customer_count = Customer.count
    sign_in
    visit new_note_path
    fill_in "Phone number", with: customer.phone_number
    fill_in "Name", with: customer.name
    fill_in "Call notes", with: note.content
    click_button "Create"
    expect(page).to have_content("Note was successfully created")
    expect(Note.first.customer.name).to eq(customer.name)
    expect(Customer.count).to eq(customer_count)
  end

  scenario "can mark a note as completed" do
    sign_in
    note = create(:note)
    visit edit_note_path(note)
    check "Completed"
    click_button "Update"
    expect(page).to have_content("Note was successfully updated")
    expect(Note.first.completed?).to eq(true)
  end

  scenario "can't use an invalid phone number" do
    note = build(:note)
    customer = build(:customer_with_invalid_phone_number)
    sign_in
    visit new_note_path
    fill_in "Phone number", with: customer.phone_number
    fill_in "Name", with: customer.name
    fill_in "Call notes", with: note.content
    click_button "Create"
    expect(page).to have_content("phone number format must be xxx-xxx-xxxx")
  end

  scenario "can update an existing customer's name" do
    note = build(:note)
    customer = create(:customer)
    sign_in
    visit new_note_path
    fill_in "Phone number", with: customer.phone_number
    fill_in "Name", with: "MR. T"
    fill_in "Call notes", with: note.content
    click_button "Create"
    expect(Note.first.customer.name).to eq("MR. T")
  end
end
