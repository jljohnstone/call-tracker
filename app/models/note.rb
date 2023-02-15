class Note < ApplicationRecord
  belongs_to :phone_call
  has_one :customer, through: :phone_call
  validates :content, presence: true
end
