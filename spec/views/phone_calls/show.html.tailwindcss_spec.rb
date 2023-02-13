require 'rails_helper'

RSpec.describe "phone_calls/show", type: :view do
  before(:each) do
    assign(:phone_call, create(:phone_call))
  end

  it "renders attributes in <p>" do
    render
  end
end
