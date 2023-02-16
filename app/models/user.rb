class User < ApplicationRecord
  has_many :notes
  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
