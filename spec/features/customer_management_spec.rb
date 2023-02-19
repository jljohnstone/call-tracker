require 'rails_helper'

RSpec.feature "Customer Management", type: :feature do
  scenario "can see a list of customers" do
    3.times do |c|
      create(:customer)
    end
    names = Customer.pluck(:name)
    visit customers_path
    names.each do |name|
      expect(page).to have_content(name)
    end
  end

  scenario "can see a history of customer notes on the customer show view" do
    customer1 = create(:customer)
    customer2 = create(:customer)
    10.times do
      create(:note, customer: customer1)
      create(:note, customer: customer2)
    end
    c1_notes = Note.where(customer: customer1).pluck(:content)
    c2_notes = Note.where(customer: customer2).pluck(:content)
    visit customer_path(customer1)
    c1_notes.each do |note|
      expect(page).to have_content(note)
    end
    c2_notes.each do |note|
      expect(page).to_not have_content(note)
    end
  end
end
