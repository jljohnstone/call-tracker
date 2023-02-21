class User < ApplicationRecord
  has_many :notes
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

  def full_name
    "#{first_name} #{last_name}"
  end
end
