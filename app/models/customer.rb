class Customer < ApplicationRecord
  has_many :phone_calls
  has_many :notes, through: :phone_calls
  validates :name, presence: true
  validates :phone_number, presence: true
end
