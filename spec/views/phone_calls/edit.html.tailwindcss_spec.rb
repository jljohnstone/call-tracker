require 'rails_helper'

RSpec.describe "phone_calls/edit", type: :view do
  let(:phone_call) {
    create(:phone_call)
  }

  before(:each) do
    assign(:phone_call, phone_call)
  end

  it "renders the edit phone_call form" do
    render

    assert_select "form[action=?][method=?]", phone_call_path(phone_call), "post" do
    end
  end
end
