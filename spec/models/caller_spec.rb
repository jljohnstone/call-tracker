require 'rails_helper'

RSpec.describe Caller, type: :model do
  let(:caller) { build(:caller) }

  it "has a valid factory" do
    expect(subject).to be_valid
  end
end
