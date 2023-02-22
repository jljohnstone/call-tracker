class Note < ApplicationRecord
  belongs_to :customer
  belongs_to :user, optional: true
  validates :content, presence: true
  # accepts_nested_attributes_for :customer
  # validates_associated :customer
end
