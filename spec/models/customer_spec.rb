require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject { create(:customer) }

  describe "validations" do
    it "has a valid factory" do
      is_expected.to be_valid
    end

    it "is invalid without a name" do
      subject.name = ""
      is_expected.to be_invalid
    end

    it "is invalid without a phone number" do
      subject.phone_number = ""
      is_expected.to be_invalid
    end
  end

end
