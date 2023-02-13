require 'rails_helper'

RSpec.describe "Phone Call Management", type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    @call1 = create(:phone_call)
    @call2 = create(:phone_call)
    @call3 = create(:phone_call)
    @call4 = create(:phone_call)
  end

  it "enables me to see a list of phone calls" do
    visit phone_calls_path
    expect(page).to have_content("Phone calls")
    expect(page).to have_content(@call1.customer.phone_number)
    expect(page).to have_content(@call2.customer.phone_number)
    expect(page).to have_content(@call3.customer.phone_number)
    expect(page).to have_content(@call4.customer.phone_number)
  end

  it "allows me to create a new phone call" do
    # visit new_phone_call_path
  end

end
