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
  end
end
