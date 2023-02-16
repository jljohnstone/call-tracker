class Customer < ApplicationRecord
  has_many :notes
  validates :name, presence: true
  validates :phone_number, presence: true
end
