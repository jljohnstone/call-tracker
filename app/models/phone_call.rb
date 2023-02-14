class PhoneCall < ApplicationRecord
  belongs_to :customer
  belongs_to :user
  accepts_nested_attributes_for :customer
end
