require 'rails_helper'

RSpec.feature "Note Management", type: :feature do
  scenario "can create a new note and associate it to a new customer" do
    note = build(:note)
    customer = build(:customer)
    sign_in
    visit root_path
    click_on "New note"
    fill_in "Name", with: customer.name
    fill_in "Phone number", with: customer.phone_number
    fill_in "Notes", with: note.content
    click_button "Save"
    expect(page).to have_content("Note saved")
    expect(Note.first.customer.phone_number).to eq(customer.phone_number)
  end

  scenario "can create a new note and associate it to an existing customer" do
    note = build(:note)
    customer = create(:customer)
    customer_count = Customer.count
    sign_in
    visit root_path
    click_on "New note"
    fill_in "Phone number", with: customer.phone_number
    fill_in "Name", with: customer.name
    fill_in "Notes", with: note.content
    click_button "Save"
    expect(page).to have_content("Note saved")
    expect(Note.first.customer.name).to eq(customer.name)
    expect(Customer.count).to eq(customer_count)
  end

  scenario "can mark a note as completed" do
    sign_in
    note = create(:note)
    visit edit_note_path(note)
    check "Completed"
    click_button "Save"
    expect(page).to have_content("Note saved")
    expect(Note.first.completed?).to eq(true)
  end

  scenario "can't delete all note content" do
    sign_in
    note = create(:note)
    visit edit_note_path(note)
    fill_in "Notes", with: ""
    click_button "Save"
    expect(page).to have_content("Notes can't be blank")
  end

  scenario "can't use an invalid phone number" do
    note = build(:note)
    customer = build(:customer_with_invalid_phone_number)
    sign_in
    visit root_path
    click_on "New note"
    fill_in "Phone number", with: customer.phone_number
    fill_in "Name", with: customer.name
    fill_in "Notes", with: note.content
    click_button "Save"
    expect(page).to have_content("phone number format must be xxx-xxx-xxxx")
  end

  scenario "can update an existing customer's name" do
    note = build(:note)
    customer = create(:customer)
    sign_in
    visit root_path
    click_on "New note"
    fill_in "Phone number", with: customer.phone_number
    fill_in "Name", with: "MR. T"
    fill_in "Notes", with: note.content
    click_button "Save"
    expect(Note.first.customer.name).to eq("MR. T")
  end

  scenario "can mark a note as a priority" do
    note = build(:note)
    customer = create(:customer)
    customer_count = Customer.count
    sign_in
    visit root_path
    click_on "New note"
    fill_in "Phone number", with: customer.phone_number
    fill_in "Name", with: customer.name
    fill_in "Notes", with: note.content
    check "Priority"
    click_button "Save"
    expect(Note.first.priority).to be_truthy
  end

  scenario "priority notes appear at the top of the list" do
    timestamp = rand(10.hours..6.days).ago
    priority_note = create(:priority_note, created_at: timestamp)
    note = create(:note)
    sign_in
    visit root_path
    expect(priority_note.customer.name).to appear_before(note.customer.name)
  end

end
