class PhoneCall < ApplicationRecord
  belongs_to :customer
  belongs_to :user, optional: true
  has_many :notes
end
