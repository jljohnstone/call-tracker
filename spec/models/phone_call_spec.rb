require 'rails_helper'

RSpec.describe PhoneCall, type: :model do
  subject { build(:phone_call) }

  it "has a valid factory" do
    expect(subject).to be_valid
  end

end
