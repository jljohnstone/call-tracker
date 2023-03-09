require 'rails_helper'

RSpec.describe Note, type: :model do
  subject { create(:note) }

  describe "validations" do
    it "has a valid factory" do
      is_expected.to be_valid
    end

    it "is invalid if the content is blank" do
      subject.content = ""
      is_expected.to be_invalid
    end

    it "is invalid if there's no associated customer" do
      subject.customer = nil
      is_expected.to be_invalid
    end

    it "is valid if there's no assigned to user" do
      subject.assigned_to_user = nil
      is_expected.to be_valid
    end

    it "is invalid if there's not created by user" do
      subject.created_by_user = nil
      is_expected.to be_invalid
    end
  end

  describe "default values" do
    it "is not completed by default" do
      expect(subject.completed?).to eq(false)
    end
  end
end
