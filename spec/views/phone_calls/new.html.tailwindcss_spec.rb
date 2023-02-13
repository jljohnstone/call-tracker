require 'rails_helper'

RSpec.describe "phone_calls/new", type: :view do
  before(:each) do
    assign(:phone_call, PhoneCall.new())
  end

  it "renders new phone_call form" do
    render

    assert_select "form[action=?][method=?]", phone_calls_path, "post" do
    end
  end
end
