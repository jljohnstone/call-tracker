require 'rails_helper'

RSpec.describe User, type: :model do

  subject { build(:user) }

  it "has a valid factory" do
    is_expected.to be_valid
  end

  it "is invalid without a name" do
    subject.name = ""
    is_expected.to be_invalid
  end

  it "is invalid without a properly formatted email address" do
    subject.email = "notreal"
    is_expected.to be_invalid
  end

end
