require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UserHelper. For example:
#
# describe UserHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe User, type: :helper do

  describe "user_initials" do
    it "provides the first and last initial upcased" do
      expect(helper.user_initials("Bill", "Smith")).to eq("BS")
    end
  end

end
