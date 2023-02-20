require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe "validations" do

    it "has a valid factory" do
      is_expected.to be_valid
    end

    it "is invalid without a first and last name" do
      subject.first_name = ""
      subject.last_name = ""
      is_expected.to be_invalid
    end

    it "is invalid without a properly formatted email address" do
      subject.email = "notreal"
      is_expected.to be_invalid
    end
  end

  describe "methods" do
    it ".initials returns the first and last initial" do
      subject.first_name = "Ken"
      subject.last_name = "Smith"
      expect(subject.initials).to eq("KS")
    end
  end

end
