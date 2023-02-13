require 'rails_helper'

RSpec.describe "phone_calls/index", type: :view do
  before(:each) do
    assign(:phone_calls, [
      create(:phone_call),
      create(:phone_call)
    ])
  end

  it "renders a list of phone_calls" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
