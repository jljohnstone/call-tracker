require 'rails_helper'

RSpec.describe PhoneCall, type: :model do
  subject { create(:phone_call) }

  describe "validations" do
    it "has a valid factory" do
      is_expected.to be_valid
    end

    it "is invalid without a customer" do
      subject.customer = nil
      is_expected.to be_invalid
    end

    it "is valid without a user" do
      subject.user = nil
      is_expected.to be_valid
    end
  end
end
